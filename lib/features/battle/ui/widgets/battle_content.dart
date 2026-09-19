import 'dart:async';

import 'package:flutter/material.dart';
import 'package:front/domain/battle/entities/battle.dart';
import 'package:front/domain/battle/enums/battle_status.enum.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_service.dart';
import 'package:front/features/battle/ui/widgets/battle_board_widget.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class BattleContent extends StatefulWidget {
  final Battle battle;
  final dynamic profile;
  final BattleService battleService;

  const BattleContent({
    super.key,
    required this.battle,
    required this.profile,
    required this.battleService,
  });

  @override
  State<BattleContent> createState() => _BattleContentState();
}

class _BattleContentState extends State<BattleContent> {
  static const _aiConnectionDelay = Duration(seconds: 5);

  Timer? _aiConnectionTimer;
  int _secondsUntilAi = _aiConnectionDelay.inSeconds;

  bool get _hasRival => widget.battle.hasRival();

  bool _isFinished(battle) {
    return (battle.status == BattleStatusEnum.finished) ||
        (battle.status == BattleStatusEnum.cancelled);
  }

  bool get _isAiConnectionScheduled => _aiConnectionTimer != null;

  @override
  void initState() {
    super.initState();
    _startAiConnectionTimer();
  }

  @override
  Widget build(BuildContext context) {
    final battle = widget.battle;

    if (_isFinished(battle)) {
      _showMatchFinishedDialog(context, battle);
    }

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).battleTitle)),
      body: _hasRival
          ? _buildBattleBoard(context, battle)
          : _WaitingForRival(
              secondsUntilAi: _secondsUntilAi,
              aiConnectionScheduled: _isAiConnectionScheduled,
              onConnectBot: _connectBot,
              onCancelAiConnection: _cancelAiConnectionTimer,
            ),
    );
  }

  void _showMatchFinishedDialog(BuildContext context, Battle battle) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: Text(S.of(context).matchFinished),
          content: _matchResult(battle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.battleService.channel.init();
              },
              child: Text(S.of(context).playAgain),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text(S.of(context).backToMenu),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).close),
            ),
          ],
        ),
      );
    });
  }

  @override
  void didUpdateWidget(covariant BattleContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_hasRival) {
      _cancelAiConnectionTimer();
      return;
    }

    if (_shouldRestartAiTimer(oldWidget)) {
      _restartAiConnectionTimer();
    }
  }

  bool _shouldRestartAiTimer(BattleContent oldWidget) {
    final wasFinished = _isFinished(oldWidget.battle);
    final isNewBattle = oldWidget.battle.id != widget.battle.id;
    return (wasFinished || isNewBattle) && !_isAiConnectionScheduled;
  }

  @override
  void dispose() {
    _aiConnectionTimer?.cancel();
    super.dispose();
  }

  void _startAiConnectionTimer() {
    if (_hasRival || _aiConnectionTimer != null) {
      return;
    }

    _aiConnectionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted || _hasRival) {
        timer.cancel();
        return;
      }

      if (_secondsUntilAi <= 1) {
        timer.cancel();
        _connectBot();
        return;
      }

      setState(() => _secondsUntilAi--);
    });
  }

  void _restartAiConnectionTimer() {
    setState(() {
      _secondsUntilAi = _aiConnectionDelay.inSeconds;
    });
    _startAiConnectionTimer();
  }

  void _cancelAiConnectionTimer() {
    _aiConnectionTimer?.cancel();
    _aiConnectionTimer = null;
    setState(() => {});
  }

  void _connectBot() {
    _cancelAiConnectionTimer();
    widget.battleService.connectBot(widget.battle.id);
  }

  Widget _buildBattleBoard(BuildContext context, Battle battle) {
    try {
      return BattleBoardWideget(
        battle: battle,
        profile: widget.profile,
        battleService: widget.battleService,
      );
    } catch (error, stackTrace) {
      debugPrint('UI error: $error\n$stackTrace');
      return Text(S.of(context).error(error));
    }
  }

  Widget _matchResult(Battle battle) {
    if (battle.winnerId == null) {
      return Text(
        battle.status == BattleStatusEnum.cancelled
            ? S.of(context).cancelled
            : S.of(context).draw,
      );
    }

    return Text(
      widget.profile.id == battle.winnerId
          ? S.of(context).youWon
          : S.of(context).youLost,
    );
  }
}

class _WaitingForRival extends StatelessWidget {
  final int secondsUntilAi;
  final bool aiConnectionScheduled;
  final VoidCallback onConnectBot;
  final VoidCallback onCancelAiConnection;

  const _WaitingForRival({
    required this.secondsUntilAi,
    required this.aiConnectionScheduled,
    required this.onConnectBot,
    required this.onCancelAiConnection,
  });

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(strings.waitingForRival),
          if (aiConnectionScheduled) ...[
            const SizedBox(height: 8),
            Text(strings.aiWillConnectIn(secondsUntilAi)),
          ],
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onConnectBot,
            child: Text(
              aiConnectionScheduled ? strings.connectAiNow : strings.playWithAi,
            ),
          ),
          if (aiConnectionScheduled) ...[
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: onCancelAiConnection,
              child: Text(strings.cancelAiConnection),
            ),
          ],
        ],
      ),
    );
  }
}

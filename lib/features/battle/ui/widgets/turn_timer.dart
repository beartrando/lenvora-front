import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:front/domain/battle/value_objects/battle_id.dart';
import 'package:front/features/battle/infrastructure/websocket/battle_service.dart';
import 'package:front/infrastructure/localization/generated/l10n.dart';

class TurnTimer extends StatefulWidget {
  final Text text;
  final int seconds;
  final BattleId? battleId;
  final BattleService battleService;

  const TurnTimer({
    super.key,
    required this.text,
    this.seconds = 2000,
    required this.battleService,
    this.battleId = null,
  });

  @override
  State<TurnTimer> createState() => _TurnTimerState();
}

class _TurnTimerState extends State<TurnTimer> {
  late int remaining;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remaining > 0) {
        setState(() => remaining--);
      } else {
        t.cancel();
        if (widget.battleId != null) {
          widget.battleService.leave(widget.battleId!);
        }
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.text,
        const SizedBox(width: 4),
        Text(S.of(context).secondsRemaining(remaining)),
      ],
    );
  }
}

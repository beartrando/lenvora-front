import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:front/features/battle/domain/battle_domain.dart';

class TurnTimer extends StatefulWidget {
  final int seconds;
  final String battleId;
  final BattleService battleService;

  const TurnTimer({
    super.key,
    this.seconds = 2000,
    required this.battleService,
    required this.battleId,
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
        widget.battleService.leave(battleId: widget.battleId);
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
    return Text("Your turn ($remaining s)");
  }
}

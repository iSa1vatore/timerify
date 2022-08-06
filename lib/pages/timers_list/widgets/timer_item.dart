import 'package:flutter/material.dart';
import 'package:timerify/extensions/build_context.dart';

import '../../../model/timer_info.dart';

class TimerItem extends StatelessWidget {
  const TimerItem(
    this.timer, {
    Key? key,
  }) : super(key: key);

  final TimerInfo timer;

  @override
  Widget build(BuildContext context) {
    var details = timer.paused ? "paused" : "${timer.secondsLeft} sec";

    return Row(
      children: [
        Text("Timer ${timer.number}", style: context.textTheme.subtitle1),
        const Spacer(),
        Text(details, style: context.textTheme.subtitle1),
      ],
    );
  }
}

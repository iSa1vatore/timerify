import 'dart:async';

import 'package:flutter/material.dart';

import 'timer_info.dart';

class TimersModel extends InheritedWidget {
  final ValueNotifier<List<TimerInfo>> timers = ValueNotifier([]);

  TimersModel({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child) {
    Timer.periodic(const Duration(seconds: 1), (_) {
      var timersList = timers.value;

      List<TimerInfo> newTimersList = [];
      for (var i = 0; i < timersList.length; i++) {
        var timer = timersList[i];

        if (newTimersList.length < 4) {
          var secondsLeft = timer.secondsLeft - 1;

          if (secondsLeft > 0) {
            newTimersList.add(timer.copyWith(
              paused: false,
              secondsLeft: secondsLeft,
            ));
          }
        } else {
          newTimersList.add(timer);
        }
      }

      timers.value = newTimersList;
    });
  }

  void addTimer(int duration) {
    var timersList = timers.value;

    var timerNumber = timersList.isNotEmpty ? timersList.last.number + 1 : 1;

    timers.value = [
      ...timersList,
      ...[
        TimerInfo(
          number: timerNumber,
          paused: true,
          secondsLeft: duration,
        )
      ],
    ];
  }

  static TimersModel of(BuildContext context) {
    final TimersModel? result =
        context.dependOnInheritedWidgetOfExactType<TimersModel>();
    assert(result != null, 'No TimersModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TimersModel oldWidget) => oldWidget.timers != timers;
}

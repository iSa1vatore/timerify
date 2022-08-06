import 'package:flutter/material.dart';
import 'package:timerify/extensions/build_context.dart';
import 'package:timerify/pages/timers_list/widgets/timer_item.dart';

import '../../model/timer_info.dart';
import '../../model/timers_model.dart';
import '../add_timer/add_timer.dart';

class TimersListPage extends StatelessWidget {
  const TimersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timersModel = TimersModel.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("TIMERS LIST")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTimerPage()),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: timersModel.timers,
          builder: (
            BuildContext context,
            List<TimerInfo> timers,
            _,
          ) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Divider(),
                    ),
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return TimerItem(timers[index]);
                    },
                    itemCount: timers.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "TOTAL: ${timers.length}",
                    style: context.textTheme.subtitle1,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

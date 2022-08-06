import 'dart:math';

import 'package:flutter/material.dart';

import '../../model/timers_model.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timersModel = TimersModel.of(context);
    var random = Random();

    return Scaffold(
      appBar: AppBar(title: const Text("NEW TIMER")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () => timersModel.addTimer(random.nextInt(15) + 5),
              child: const Text('Start Random Timer'),
            ),
          ),
        ),
      ),
    );
  }
}

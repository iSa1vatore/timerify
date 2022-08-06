import 'package:flutter/material.dart';
import 'package:timerify/pages/timers_list/timers_list.dart';

import 'model/timers_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimersModel(
      child: MaterialApp(
        title: 'Timerify',
        theme: ThemeData(
          primarySwatch: Colors.red,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        debugShowCheckedModeBanner: false,
        home: const TimersListPage(),
      ),
    );
  }
}

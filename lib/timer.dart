import 'package:flutter/material.dart';
import 'package:flutter_timer_demo/timerwatch.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text("Flutter Timer"),
      ),
      body: TimerPage(),
    );
  }
}

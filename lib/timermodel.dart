import 'package:flutter_timer_demo/data/db_helper.dart';

class TimerModel {
  final String timertime;

  TimerModel({this.timertime});

  factory TimerModel.fromDb(Map map) {
    return TimerModel(timertime: map[TimerTable.TIMER_TIME]);
  }

  Map<String, dynamic> forDb() {
    return {
      TimerTable.TIMER_TIME: timertime,
    };
  }

  @override
  String toString() {
    return "{$timertime}";
  }
}

import 'dart:io';

import 'package:flutter_timer_demo/data/db_helper.dart';
import 'package:flutter_timer_demo/timermodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase db = AppDatabase._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "timer.db");
    return await openDatabase(path,
        version: 1,
        onOpen: (db) {},
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE ${TimerTable.TABLE_NAME}"
        "(${TimerTable.TIMER_TIME} VARCHAR );");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    //To be implemented
  }

  Future<int> saveTimer(String timertime) async {
    var dbClient = await database;
    await dbClient.execute(
        'INSERT INTO ${TimerTable.TABLE_NAME}(${TimerTable.TIMER_TIME}) VALUES(' +
            '\'' +
            timertime +
            '\')');
  }

  Future<List<TimerModel>> getAllTimers() async {
    final db = await database;
    var res = await db.query("${TimerTable.TABLE_NAME}");
    List<TimerModel> list =
        res.isNotEmpty ? res.map((c) => TimerModel.fromDb(c)).toList() : [];
    return list;
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("DELETE FROM ${TimerTable.TABLE_NAME}");
  }
}

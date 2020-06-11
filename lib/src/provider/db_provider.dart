import 'dart:io';
import 'package:clock/src/models/alarm_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _dataBase;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if(_dataBase != null) return _dataBase;
    _dataBase =  await initDB();

    return _dataBase;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'AlarmsDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Alarms ('
          'id INTEGER PRIMARY KEY,'
          'active INTEGER,'
          'dateActive TEXT,'
          'repeat TEXT,'
          'sound INTEGER,'
          'hasSound INTEGER,'
          'title TEXT,'
          'duration INTEGER,'
          'postpone INTEGER,'
          'postponeTimes INTEGER'
          ')'
        );
      }
    );
  }

  addAlarm(AlarmModel alarm) async{
    final db = await database;
    final res = await db.insert("Alarms", alarm.toJson());
    return res;
  }

  Future<int> updateAlarm(AlarmModel alarm) async {
    final db = await database;
    final res  = await db.update('Alarms', alarm.toJson(), where: 'id = ?', whereArgs: [alarm.id]);
    return res;
  }

  Future<List<AlarmModel>> getAlarms() async{
    final db = await database;
    final res = await  db.query('Alarms');
    List<AlarmModel> list = res.isNotEmpty
                          ? res.map((e) => AlarmModel.fromJson(e)).toList()
                          : [];
    return list;
  }

}
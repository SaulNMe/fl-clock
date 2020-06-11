import 'dart:async';

import 'package:clock/src/models/alarm_model.dart';
import 'package:clock/src/provider/db_provider.dart';

class AlarmBloc {
  static final AlarmBloc _singleton = AlarmBloc._internal();

  factory AlarmBloc(){
    return _singleton;
  }

  AlarmBloc._internal() {
    obtenerAlarms();
  }

  final _alarmsController = StreamController<List<AlarmModel>>.broadcast();

  Stream<List<AlarmModel>> get alarmStream => _alarmsController.stream;
  
  dispose() {
    _alarmsController?.close();
  }

  obtenerAlarms() async {
    _alarmsController.sink.add(await DBProvider.db.getAlarms());
  }

  addAlarm(AlarmModel alarm) async {
    await DBProvider.db.addAlarm(alarm);
    obtenerAlarms();
  }

  updateScan(AlarmModel alarm) async {
    await DBProvider.db.updateAlarm(alarm);
    obtenerAlarms();
  }

}
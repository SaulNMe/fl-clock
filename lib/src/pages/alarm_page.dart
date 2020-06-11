import 'package:clock/src/bloc/alarm_bloc.dart';
import 'package:clock/src/models/alarm_model.dart';
import 'package:flutter/material.dart';

import 'package:clock/src/widgets/alarm_item.dart';
import 'package:clock/src/widgets/appbar.dart';
import 'package:clock/src/widgets/custom_animated_switcher.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  bool alarm1 = false;
  final alarmBloc = AlarmBloc();

  @override
  Widget build(BuildContext context) {
    alarmBloc.obtenerAlarms();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          Appbar(title: 'Alarmas',),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0,),
              CustomAnimatedSwitcher(),
              SizedBox(height: 40.0,),
              getAlarms(),
              SizedBox(height: 80.0,),
            ]),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 10.0,
              color: Theme.of(context).cursorColor,
            ),
            BoxShadow(
              offset: Offset(-5, -5),
              blurRadius: 10.0,
              color: Theme.of(context).highlightColor,
            )
          ],
        ),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, 'alarmDetail');
          },
          backgroundColor: Theme.of(context).backgroundColor,
          child: Icon(Icons.add, color: Theme.of(context).primaryColor,),
          elevation: 0,
        ),
      ),
    );
  }

  void _activeAlarm(AlarmModel alarm){
    if(alarm.active == 0) {
      alarm.active = 1;
    } else {
      alarm.active = 0;
    }
    alarmBloc.updateScan(alarm);
    setState(() => alarm1 = !alarm1);
  }

  Widget getAlarms() {
    return Container(
      height: double.maxFinite,
      child: StreamBuilder<List<AlarmModel>>(
        stream: alarmBloc.alarmStream,
        builder: (BuildContext context, AsyncSnapshot<List<AlarmModel>> snapshot) {
          if(!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final alarms = snapshot.data;
          if(alarms.length == 0) {
            return Center(child: Text('No hay alarmas'),);
          } 
          return ListView.builder(
            itemCount: alarms.length,
            itemBuilder: (BuildContext context, int i){
              return AlarmItem(alarmModel: alarms[i], active: alarms[i].active == 1 ? true : false, onChange: _activeAlarm,);
            });
        }
      ),
    );
    
  }
}
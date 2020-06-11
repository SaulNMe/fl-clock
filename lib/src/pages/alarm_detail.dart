import 'package:clock/src/bloc/alarm_bloc.dart';
import 'package:clock/src/models/alarm_model.dart';
import 'package:clock/src/widgets/config_repeat.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:clock/src/widgets/button_icon.dart';
import 'package:clock/src/widgets/config_duration.dart';
import 'package:clock/src/widgets/config_item.dart';
import 'package:clock/src/widgets/config_item_switch.dart';
import 'package:clock/src/widgets/config_days.dart';
import 'package:clock/src/widgets/custom_alert_dialog.dart';
import 'package:clock/src/widgets/custom_divider.dart';

class AlarmDetailPage extends StatefulWidget {
  @override
  _AlarmDetailPageState createState() => _AlarmDetailPageState();
}

class _AlarmDetailPageState extends State<AlarmDetailPage> {
  Theme minutePicher;
  Theme hourPicker;
  int _currentHourValue = DateTime.now().hour;
  int _currentMinuValue = DateTime.now().minute;
  bool selected = true;
  bool vibrate = false;

  AlarmModel alarmModel = AlarmModel();
  final alarmBloc = AlarmBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AlarmModel alarmArgs = ModalRoute.of(context).settings.arguments;
    if(alarmArgs != null) {
      print('args');
      print(alarmArgs.hasSound);
      alarmModel = alarmArgs;
    } else {
      print('new');
      alarmModel.title = "Alarma";
      alarmModel.active = 1;
      alarmModel.dateActive =  DateFormat().format(DateTime.now());
      alarmModel.repeat = "";
      alarmModel.sound = 0;
      alarmModel.hasSound = 1;
      alarmModel.duration = 5;
      alarmModel.postpone = 5;
      alarmModel.postponeTimes = 3;
    }

    _initializeNumberPickers(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE3EDF7),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xFFE3EDF7),
            elevation: 0,
            leading: Container(),
            flexibleSpace: _createAppbar(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _pickers(),
              SizedBox(height: 30.0,),
              ConfigItem(title: 'Repetir', subtitle: 'Sound once', onTap: _daysConfig,),
              CustomDivider(),
              ConfigItem(title: 'Sonido', subtitle: 'Aegean Ocean', onTap:  (){},),
              CustomDivider(),
              ConfigItemSwitch(title: 'Sonido', selected: alarmModel.hasSound == 1 ? true: false, onTap: _activeSound,),
              CustomDivider(),
              ConfigItem(title: 'Nombre', subtitle: '${alarmModel.title}', onTap:  _showAlarmDialogName,),
              CustomDivider(),
              ConfigItem(title: 'Duración del timbre', subtitle: '5 minutos', onTap: _setDuration,),
              CustomDivider(),
              ConfigItem(title: 'Configuración repetición', subtitle: '5 min, 3x', onTap: _repeatConfig,),
            ],
          ),
        ),
      ),
    );
  }


  void _activeSound(){
    setState(() {
      print(alarmModel.hasSound);
      if(alarmModel.hasSound == 0) alarmModel.hasSound = 1; 
      else alarmModel.hasSound = 0;
    });
  }

  //Vibration.vibrate(repeat: 1, pattern: [500, 2000]);
  // void _selectSound() async{
  //   FlutterRingtonePlayer.play(
  //     android: AndroidSounds.ringtone, 
  //     ios: IosSounds.bell,
  //     looping: true,
  //     volume: 0.5,
  //     asAlarm: true
  //   );
  // }

  void _setAlarmName(String val){
    alarmModel.title = val;
    setState(() {
    });
    print(alarmModel.title);
  }

  void _showAlarmDialogName(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(text: alarmModel.title, onTap: _setAlarmName);
      }
    );
  }

  void _setDuration() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF686D71),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.6,
          color: Color(0xFF686D71),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
            ),
            child: ConfigDuration()
          )
        );
      }
    );
  }
  
  void _repeatConfig(){
    showModalBottomSheet(
      context: context, 
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.5,
          color: Color(0xFF686D71),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE3EDF7),
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
            ),
            child: ConfigRepeat()
          )
        );
      }
    );
  }

  void _daysConfig(){
    showModalBottomSheet(
      context: context, 
      backgroundColor: Color(0xFF686D71),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          //margin: EdgeInsets.symmetric(horizontal: 10.0),
          height: MediaQuery.of(context).copyWith().size.height * 0.65,
          color: Color(0xFF686D71),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE3EDF7),
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
            ),
            child: ConfigDays()
          )
        );
    });
  }

  Widget _pickers() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        hourPicker,
        minutePicher
      ],
    );
  }
  

  Widget _createAppbar(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: 60.0,
        color:  Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ButtonIcon(icon: Icons.close, onTap: _close,),
            Text("Agregar Alarma", style: Theme.of(context).textTheme.headline3,),
            ButtonIcon(icon: Icons.check, onTap: _setAlarm,),
          ],
        ),
      ),
    );
  }

  void _setAlarm(BuildContext context){
    if(ModalRoute.of(context).settings.arguments != null) {
      print('update');
      alarmBloc.updateScan(alarmModel);
    } else {
      print('add');
      alarmBloc.addAlarm(alarmModel);
    }
    Navigator.pop(context);
  }

  void _close(BuildContext context){
    Navigator.pop(context);
  }

  void _initializeNumberPickers(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ThemeData themeData = ThemeData(
      accentColor: Color(0xFF00DB72),
      textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
        headline: GoogleFonts.orbitron(textStyle: textTheme.headline, fontSize: 32.0,),
        body1: GoogleFonts.orbitron(textStyle: textTheme.body1, fontSize: 32.0, color: Theme.of(context).primaryColor),
      )
    );

    final decoration = BoxDecoration(
          border: Border.symmetric(vertical: BorderSide(width: 2.0, color: Theme.of(context).textTheme.headline2.color))
        );

    hourPicker = Theme(
      data: themeData,
      child: new NumberPicker.integer(
        decoration: decoration,
        infiniteLoop: true,
        initialValue: _currentHourValue,
        minValue: 0,
        maxValue: 24,
        step: 1,
        onChanged: (value) => setState(() => _currentHourValue = value),
      )
    ); 

    minutePicher = Theme(
      data: themeData, 
      child: new NumberPicker.integer(
        decoration: decoration,
        infiniteLoop: true,
        initialValue: _currentMinuValue, 
        minValue: 0, 
        maxValue: 59, 
        step: 1,
        onChanged: (value) => setState(() =>_currentMinuValue = value )),
    );

  }

}
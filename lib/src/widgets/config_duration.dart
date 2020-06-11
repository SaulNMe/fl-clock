import 'package:clock/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ConfigDuration extends StatefulWidget {
  @override
  _ConfigDurationState createState() => _ConfigDurationState();
}

enum DurationAlarm { uno, cinco, diez, quince, veinte, treinta }

class _ConfigDurationState extends State<ConfigDuration> {

  DurationAlarm _duration = DurationAlarm.cinco;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text('Duración', style: Theme.of(context).textTheme.headline3),
          ),
          RadioListTile(
            title: Text('1 minuto', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.uno, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          RadioListTile(
            title: Text('5 minutos', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.cinco, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          RadioListTile(
            title: Text('10 minutos', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.diez, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          RadioListTile(
            title: Text('15 minutos', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.quince, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          RadioListTile(
            title: Text('20 minutos', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.veinte, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          RadioListTile(
            title: Text('30 minutos', style: Theme.of(context).textTheme.headline4,),
            dense: true,
            activeColor: Theme.of(context).primaryColor,
            value: DurationAlarm.treinta, 
            groupValue: _duration, 
            onChanged: (DurationAlarm value) { setState(() { _duration = value; }); },
          ),
          Container(
            alignment: Alignment.center,
            child: PrimaryButton(color: Theme.of(context).errorColor,text: 'Cancelar', onTap:() => Navigator.pop(context)),
          )
        ],
      ),
    );
  }
}
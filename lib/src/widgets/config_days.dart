import 'package:clock/src/models/day_model.dart';
import 'package:clock/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ConfigDays extends StatefulWidget {
  @override
  _ConfigDaysState createState() => _ConfigDaysState();
}

class _ConfigDaysState extends State<ConfigDays> {
  bool checked = false;

  List<Day> days = [
    Day(day: "Domingo", selected: false),
    Day(day: "Lunes", selected: false),
    Day(day: "Martes", selected: false),
    Day(day: "Miércoles", selected: false),
    Day(day: "Jueves", selected: false),
    Day(day: "Viernes", selected: false),
    Day(day: "Sábado", selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text('Repetir', style: Theme.of(context).textTheme.headline3),
          ),
          for (final day in days)
            ListTile(
              dense: true,
              title: Text(day.day, style: Theme.of(context).textTheme.headline4),
              trailing: _createCheckBox(day),
              onTap: () => setState(() => day.selected = !day.selected),
            ),
          _setAlarm(),
        ],
      ),
    );
  }

  Widget _setAlarm() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PrimaryButton(text: 'Cancelar', onTap: () => Navigator.pop(context) ,),
          PrimaryButton(text: 'Aceptar', onTap: () =>Navigator.pop(context),),
        ],
      )
    );
  }

  Widget _createCheckBox(Day day) {
    return Theme(
      data: ThemeData(unselectedWidgetColor: Theme.of(context).primaryColor, ),
      child: Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.white,
        visualDensity: VisualDensity.standard,
        value: day.selected,  
        onChanged: (val) => setState(() => day.selected = val)
      ),
    );
  }

}
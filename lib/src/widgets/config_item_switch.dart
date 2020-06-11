import 'package:clock/src/widgets/custom_switch.dart';
import 'package:flutter/material.dart';

class ConfigItemSwitch extends StatelessWidget {
  const ConfigItemSwitch({this.title, this.onTap, this.selected});
  final title;
  final onTap;
  final selected;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFE3EDF7),
          border: Border.all(
            color: Color(0xFFE3EDF7),
            width: 2.0,
            style: BorderStyle.solid
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text("$title", style: TextStyle(fontSize: 18.0, color: Color(0xFF000721)),),
            ),
            CustomSwitch(selected: selected, onChange: onTap,)
          ],
        )
      ),
    );
  }
}
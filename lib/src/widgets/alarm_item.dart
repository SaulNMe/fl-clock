import 'package:clock/src/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class AlarmItem extends StatefulWidget {

  const AlarmItem({this.title, this.subtitle, @required this.active, @required this.onChange, this.alarmModel});

  final title;
  final subtitle;
  final active;
  final onChange;
  final alarmModel;

  @override
  _AlarmItemState createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  bool selected;

  @override
  void initState() { 
    print(widget.active);
    setState(() {
      selected = widget.active;

    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'alarmDetail', arguments: widget.alarmModel);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
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
          ]
        ),
        child: ListTile(
          title: Text(widget.alarmModel.title, style: Theme.of(context).textTheme.headline1,),
          subtitle: Text('Casd', style: Theme.of(context).textTheme.headline2,),
          trailing: CustomSwitch(selected: selected, onChange: _changeState,),
        ),
      ),
    );
  }

  void _changeState(){
    widget.onChange(widget.alarmModel);
    setState(() {
      selected = !selected;
    });
  }
}
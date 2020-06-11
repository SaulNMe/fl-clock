import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {

  const CustomSwitch({this.selected, this.onChange});

  final selected;
  final onChange;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onChange();
        setState(() {
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.bounceOut,
        width: 55,
        height: 30,
        alignment: widget.selected ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: widget.selected ? Theme.of(context).indicatorColor : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2.0, 
            color: widget.selected ? Theme.of(context).canvasColor : Theme.of(context).indicatorColor,
            style: BorderStyle.solid
          ),
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: widget.selected ? Theme.of(context).primaryColor : Theme.of(context).backgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).indicatorColor,
                offset: Offset(3.0,1.0),
                blurRadius: 4.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
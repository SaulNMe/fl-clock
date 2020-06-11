import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final title;
  final min;
  final max;
  final onTap;
  final id;
  final value;
  final divisions;
  final values;
  const CustomSlider({this.values, this.divisions,this.id, this.value, this.title, this.min, this.max, this.onTap});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(widget.title, 
            style: TextStyle(
              color: Color(0xFF000721),  
              fontSize: 18.0
            )
          ),
          Slider(
            activeColor: Color(0xFF31456A),
            inactiveColor: Color(0xFF656565),
            value: widget.value, 
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            onChanged: (val) => widget.onTap(widget.id, val)
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (var item in widget.values) 
                Text(item.toString(), style: TextStyle(color: Color(0xFFAAAAAA)),),
              ],
            )
          )
        ],
      ),
    );
  }
}
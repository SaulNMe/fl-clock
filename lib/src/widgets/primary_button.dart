import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({this.text, this.onTap, this.color});

  final text;
  final onTap;
  final color;


  final BoxDecoration _boxDecoration = BoxDecoration(
    color: Color(0xFFE3EDF7),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        offset: Offset(5, 5),
        blurRadius: 10.0,
        color: Color(0xFFADC5DD),
      ),
      BoxShadow(
        offset: Offset(-5, -5),
        blurRadius: 10.0,
        color: Color(0xFFF4F4F4),
      )
    ], 
  );

  @override
  Widget build(BuildContext context) {
    final _color = color != null ? color : Color(0xFF31456A);
    return GestureDetector(
      onTap: onTap,
      child: Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            decoration: _boxDecoration,
            child: Text(text, style: TextStyle(fontSize: 18.0, color: _color, fontWeight: FontWeight.bold),),
          ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      width: double.infinity,
      height: 5,
      decoration: BoxDecoration(
        color: Color(0xFFE3EDF7),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 4.0,
              color: Color(0xFFADC5DD),
            ),
            BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 4.0,
              color: Color(0xFFF4F4F4),
            )
          ], 
      ),
    );
  }
}
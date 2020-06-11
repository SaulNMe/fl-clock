import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {

  ButtonIcon({this.onTap, this.icon});

  final IconData icon;
  final onTap;


  @override
  Widget build(BuildContext context) {
    final BoxDecoration _boxDecoration = BoxDecoration(
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
      ], 
    );
    return GestureDetector(      
      onTap: 	(){
        onTap(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        height: 46,
        width: 46,
        decoration: _boxDecoration,
        child: Icon(icon, color: Theme.of(context).accentColor, size: 24.0,),
      ),
    );
  }
}
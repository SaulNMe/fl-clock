import 'package:flutter/material.dart';

class ConfigItem extends StatelessWidget {
  const ConfigItem({this.title,this.subtitle, this.onTap});
  final title;
  final subtitle;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text("$title", style: Theme.of(context).textTheme.headline5),
            ),
            Text("$subtitle", style: Theme.of(context).textTheme.headline4,),
            Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor)
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      brightness: Brightness.light,
      titleSpacing: 10,
      elevation: 0,
      title: Text(title, style: Theme.of(context).textTheme.subtitle1,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
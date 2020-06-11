import 'package:clock/src/widgets/appbar.dart';
import 'package:clock/src/widgets/custom_animated_switcher.dart';
import 'package:flutter/material.dart';

class ClocksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3EDF7),
      body: CustomScrollView(
        slivers: <Widget>[
          Appbar(title: 'Relojes',),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0,),
              CustomAnimatedSwitcher(),
              SizedBox(height: 40.0,),
            ]),
          ),
        ],
      ),
    );
  }


}
import 'package:clock/src/widgets/analogic_clock.dart';
import 'package:clock/src/widgets/digital_clock.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatefulWidget {
  @override
  CustomAnimatedSwitcherState createState() => CustomAnimatedSwitcherState();
}

class CustomAnimatedSwitcherState extends State<CustomAnimatedSwitcher> {
  Widget _clockMode;

  @override
  void initState() {
      _clockMode = DigitalClock(_changeClock);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      key: ValueKey(1.0),
      transitionBuilder: (Widget child, Animation<double> animation){
        return ScaleTransition(scale: animation, child: child,);
      },
      switchOutCurve: Curves.easeIn,
      switchInCurve: Curves.easeInOut,
      duration: Duration(milliseconds: 400),
      child: _clockMode,
    );
  }

  void _changeClock(bool analog){
    setState(() => _clockMode = analog ? AnalogicClock(_changeClock) : DigitalClock(_changeClock));
  }

}
import 'dart:async';

import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class AnalogicClock extends StatefulWidget {
  final onChange;
  const AnalogicClock(this.onChange);

  @override
  _AnalogicClockState createState() => _AnalogicClockState();
}

class _AnalogicClockState extends State<AnalogicClock> {
  DateTime dateTime;
  Timer timer;

  @override
  void initState() {
    dateTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _setTime());
    setState(() => dateTime = DateTime.now());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChange(false),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        color: Color(0xFFE3EDF7),
        child: Container(
          margin: EdgeInsets.only(bottom: 15.0),
          width: 260.0,
          height: 260.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(130.0),
            color: Color(0xFFE3EDF7),
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
            ]
          ),
          child: AnalogClock(
            secondHandColor: Colors.red,
            digitalClockColor: Colors.orange,
            hourHandColor: Color(0xFFAAAAAA),
            minuteHandColor: Color(0xFFAAAAAA),
            tickColor: Color(0xFFAAAAAA),
            decoration: BoxDecoration(color: Color(0xFFE3EDF7), shape: BoxShape.circle),
            width: 260.0,
            isLive: true,
            showNumbers: false,
            showDigitalClock: false,
            datetime: DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second),
            key: GlobalObjectKey(1),
          ),
        ),
      ),
    );
  }

  void _setTime() {
    setState(() {
      dateTime = DateTime.now();
    });
  }
}
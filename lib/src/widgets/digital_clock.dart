import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'dart:async';

class DigitalClock extends StatefulWidget {
  final onChange;
  const DigitalClock(this.onChange);

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _timeString;
  Timer timer;
  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer  = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime() );
    super.initState();
  }

  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        key: ValueKey(1.0),
        onTap: () {
          widget.onChange(true);
        },
        child: Container(
          alignment: Alignment.center,
          height: 260,
          color: Color(0xFFE3EDF7),
          margin: EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: Text(_timeString,
            style: GoogleFonts.orbitron(
              fontSize: 48.0,
              color: Color(0xFF000721)
            ),
          ),
        )
      );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('H:mm:s').format(dateTime);
  }
}
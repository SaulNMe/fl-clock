import 'package:clock/src/pages/alarm_detail.dart';
import 'package:clock/src/pages/alarm_page.dart';
import 'package:clock/src/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final textTheme = Theme.of(context).textTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Color(0xFFE3EDF7),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.red,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'alarm': (BuildContext context) => AlarmPage(),
        'alarmDetail': (BuildContext context) => AlarmDetailPage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF31456A),
        accentColor: Color(0xFF000721),
        backgroundColor: Color(0xFFE3EDF7),
        indicatorColor: Color(0xFFB8CDE1),
        canvasColor: Color(0xFF84A5C7),
        buttonColor: Color(0xFF656565),
        cursorColor: Color(0xFFADC5DD),
        highlightColor: Color(0xFFF4F4F4),
        errorColor: Color(0xFFFF7575),
        textTheme: TextTheme(
          headline1: TextStyle(color: Color(0xFF656565), fontSize: 18.0, fontWeight: FontWeight.w600),
          headline2: TextStyle(color: Color(0xFF9D9D9D), fontSize: 18.0),
          headline3: TextStyle(color: Color(0xFF000721), fontSize: 18.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(color: Color(0xFF31456A), fontSize: 18.0, fontWeight: FontWeight.normal),
          headline5: TextStyle(color: Color(0xFF000721), fontSize: 18.0, fontWeight: FontWeight.normal),
          subtitle1: TextStyle(color: Color(0xFF000721), fontSize: 24.0, fontWeight: FontWeight.bold,),

        )
      ),
    );
  }
}
import 'package:clock/src/pages/alarm_page.dart';
import 'package:clock/src/pages/clocks_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _setPage(_currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _setPage(int index) {
    switch(index) {
      case 0: return AlarmPage();
      case 1: return ClocksPage();
      default: return AlarmPage();
    }
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFE3EDF7),
      elevation: 0,
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      iconSize: 30.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm), 
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.language), 
          title: Container()
        ),
      ],
    );
  }
}
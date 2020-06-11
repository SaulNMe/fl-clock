import 'package:clock/src/widgets/custom_slider.dart';
import 'package:clock/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ConfigRepeat extends StatefulWidget {
  @override
  _ConfigRepeatState createState() => _ConfigRepeatState();
}

class _ConfigRepeatState extends State<ConfigRepeat> {
  double _sliderValue1 = 5.0;
  double _sliderValue2 = 1.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Configuración de repetición', 
                  style: TextStyle(
                    color: Color(0xFF000721), 
                    fontWeight: FontWeight.w700, 
                    fontSize: 20.0
                  )
                ),
                SizedBox(height: 20.0,),
                CustomSlider(divisions: 5, values: ['5','10','15','20','25','30'], value: _sliderValue1, id: "1", min: 5.0, max:30.0, onTap: _setSlider, title: "Posponer durante (min)"),
                CustomSlider(divisions: 3, values: ['1','3','5','10'], value: _sliderValue2, id: "2", min: 1.0, max:10.0, onTap: _setSlider, title: "Cuántas vece se pospone antes de silenciarse automáticamente"),
                SizedBox(height: 10.0,),
                _cancelOk(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cancelOk(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PrimaryButton(text: 'Cancelar', onTap: () => Navigator.pop(context) ,),
          PrimaryButton(text: 'Aceptar', onTap: () =>Navigator.pop(context),),
        ],
      )
    );
  }

  void _setSlider(String key,  double val){
    setState(() {
      if(key == "1"){
        _sliderValue1 = val;
      } else {
        _sliderValue2 = val;
      }
    });
  }
}
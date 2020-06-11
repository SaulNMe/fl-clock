import 'package:clock/src/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({this.text, this.onTap});
  final text;
  final onTap;

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextEditingController alarmNameController;

  @override
  void initState() {
    super.initState();
    alarmNameController = TextEditingController();
    alarmNameController.text = widget.text;
  }

  void dispose() {
    alarmNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      
      title: Text("Nombre", style: Theme.of(context).textTheme.headline3,),
      backgroundColor: Theme.of(context).backgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            style: Theme.of(context).textTheme.headline5,
            controller: alarmNameController,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2.0, style: BorderStyle.solid, color: Theme.of(context).buttonColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2.0, style: BorderStyle.solid, color: Theme.of(context).primaryColor),
              ),
            ),
            onChanged: (val) {
            },
            onSubmitted: (s) => _onTap(),
          ),
          Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PrimaryButton(text: 'Cancelar', onTap: _cancel),
              PrimaryButton(text: 'Aceptar', onTap: _onTap),
            ],
          ))
        ],
      ),
    );
  }

  void _cancel(){
    Navigator.pop(context);
  }

  void _onTap(){
    if(widget.text != alarmNameController.text)
       widget.onTap(alarmNameController.text);
     _cancel();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:registrations/constant.dart';

class CustomDatepicker extends StatefulWidget {
  String Header, Hint;
  IconData icon;

  CustomDatepicker(IconData icon_name, String fullname, String hint) {
    this.Header = fullname;
    this.Hint = hint;
    this.icon = icon_name;
  }

  @override
  _CustomDatepickerState createState() =>
      _CustomDatepickerState(Header, Hint, icon);
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  String label, hint;
  IconData icon;

  _CustomDatepickerState(String header, String hint, IconData iconData) {
    this.label = header;
    this.hint = hint;
    this.icon = iconData;
  }

  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
          width: double.infinity,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [constant.firstcolor,constant.secondcolor,constant.thirdcolor]),
          ),
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: TextField(
            decoration: decoration_box(hint, icon),
            controller: dateCtl,
            onTap: () async {
              DateTime newDateTime = await showRoundedDatePicker(
                context: context,
                background: Colors.white,
                theme: ThemeData(
                  primaryColor: Colors.red[400],
                  accentColor: Colors.green[800],
                  dialogBackgroundColor: Colors.purple[50],
                  textTheme: TextTheme(
                    body1: TextStyle(color: Colors.red),
                    caption: TextStyle(color: Colors.blue),
                  ),
                  disabledColor: Colors.orange,
                  accentTextTheme: TextTheme(
                    body2: TextStyle(color: Colors.green[200]),
                  ),
                ),
              );
              dateCtl.text = newDateTime.year.toString() +
                  "/" +
                  newDateTime.month.toString() +
                  "/" +
                  newDateTime.day.toString();
            },
          ),
        ),
      ],
    );
  }

  decoration_box(String hint, IconData icon) {
    InputDecoration inputDecoration3 = InputDecoration(
      labelText: label,
      hintText: label,
      labelStyle: TextStyle(color: Colors.deepOrange),
      hintStyle: TextStyle(color: Colors.black38),
      fillColor: Colors.transparent,
      filled: true,
      prefixIcon: Icon(
        icon,
        color: Colors.deepOrange,
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.black38)),
    );
    return inputDecoration3;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dateCtl.dispose();
    super.dispose();
  }
}

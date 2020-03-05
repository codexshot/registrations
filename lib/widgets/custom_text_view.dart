import 'package:flutter/material.dart';
import 'package:registrations/constant.dart';
import 'package:registrations/model/detail_model.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class CustomTextView extends StatefulWidget {
  String Header, Hint;
  IconData icon;
  DetailModel model;

  CustomTextView(IconData icon_name, String fullname, String hint,
      DetailModel detailModel) {
    this.Header = fullname;
    this.Hint = hint;
    this.icon = icon_name;
    this.model = detailModel;
  }

  @override
  _CustomTextViewState createState() =>
      _CustomTextViewState(Header, Hint, icon, model);
}

class _CustomTextViewState extends State<CustomTextView> {
  String label, hint;
  IconData icon;
  DetailModel model;

  _CustomTextViewState(
      String header, String hint, IconData iconData, DetailModel model) {
    this.label = header;
    this.hint = hint;
    this.icon = iconData;
    this.model = model;
  }

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
            gradient: LinearGradient(colors: [
              constant.firstcolor,
              constant.secondcolor,
              constant.thirdcolor
            ]),
          ),
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: TextFormField(
            autofocus: false,
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
            decoration: decoration_box(hint, icon),
            validator: (value) {
              if (hint.toLowerCase().contains("enter your name")) {
                if (value.length < 2) {
                  return 'Name not long enough';
                } else {
                  model.name = value;
                }
              } else if (hint.toLowerCase() == "enter your email") {
                if (value.length < 2) {
                  if (value.contains("@")) {
                    model.email = value;

                    return null;
                  } else {
                    return 'enter valid email';
                  }
                }
              } else if (hint.toLowerCase() == "enter your alternate email") {
                if (value.length < 2) {
                  return 'enter valid email';
                } else {
                  model.alternateEmail = value;
                }
              } else if (hint.toLowerCase() == "enter your interests") {
                if (value.length < 1) {
                  return 'enter interests';
                } else {
                  model.interests = value;
                }
              } else if (hint.toLowerCase() == "enter your location") {
                List data = new List(4);
                data[0] = "delhi";
                data[1] = "gurgaon";
                data[2] = "noida";
                data[3] = "punjab";
                int found = 0;

                if (value.length < 2) {
                  return 'enter valid location';
                } else {
                  for (int i = 0; i < data.length; i++) {
                    if (value.toLowerCase() == data[i]) {
                      found = 1;
                    }
                  }
                  if (found == 1) {
                    model.location = value;
                    return null;
                  } else {
                    return "no place found";
                  }
                }
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }

  decoration_box(String hint, IconData icon) {
    InputDecoration inputDecoration3 = InputDecoration(
      labelText: hint,
      hintText: hint,
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

    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:registrations/constant.dart';
import 'package:registrations/model/detail_model.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class CustomAdminTextView extends StatefulWidget {
  String Header, Hint;
  IconData icon;
  DetailModel model;
  int type;

  CustomAdminTextView(IconData icon_name, String fullname, String hint,
      DetailModel detailModel, int i) {
    this.Header = fullname;
    this.Hint = hint;
    this.icon = icon_name;
    this.model = detailModel;
    this.type=i;
  }

  @override
  _CustomTextViewState createState() =>
      _CustomTextViewState(Header, Hint, icon, model,type);
}

class _CustomTextViewState extends State<CustomAdminTextView> {
  String label, hint;
  int type;
  IconData icon;
  DetailModel model;
  TextInputType textInputType;
  _CustomTextViewState(
      String header, String hint, IconData iconData, DetailModel model, int type) {
    this.label = header;
    this.hint = hint;
    this.icon = iconData;
    this.model = model;
    this.type=type;

  }

  @override
  Widget build(BuildContext context) {

    if(type==1){
      textInputType  = TextInputType.text;
    }
    else{
      textInputType= TextInputType.number;
    }
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
            keyboardType:textInputType,
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 18),
            decoration: decoration_box(hint, icon),
            validator: (value) {
              if (hint.toLowerCase().contains("enter name")) {
                if (value.toLowerCase()==model.name.toLowerCase()) {

                } else {
                  return 'Credential incorrect';
                }
              }
              else{

                if (value==model.password) {

                } else {
                  return 'Credential incorrect';
                }
              }
            }
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
    // TODO: implement dispose
    super.dispose();
  }
}

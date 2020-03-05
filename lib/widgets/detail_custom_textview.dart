

import 'package:flutter/material.dart';

class Custom_detail_text_view extends StatelessWidget {

  IconData iconData;
  String text;
  Custom_detail_text_view(IconData icon, String name){
    this.iconData=icon;
    this.text=name;
  }




  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white,
      ),
      width: double.infinity,
      height:300/4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(

              prefixIcon: Icon(iconData,color: Colors.blue,),
              border: InputBorder.none,
              labelText: text.toUpperCase(),
              labelStyle: TextStyle(fontSize: 25,color:Colors.black)
          ),
        ),
      ),
    );
  }
}

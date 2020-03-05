import 'package:flutter/material.dart';
import 'package:registrations/database/database.dart';
import 'package:registrations/model/detail_model.dart';
import 'package:registrations/pages/admin_page.dart';
import 'package:registrations/widgets/custom_admin_textview.dart';
import 'package:registrations/widgets/custom_text_view.dart';

class AdminLogin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AdminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DetailModel _model = new DetailModel();

  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    _model.name = "himanshu";
    _model.password = "1234";
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          width: double.infinity,
          child: AppBar(
            title: Text(
              "Class Scheduler",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
      body:Container(
        color: Colors.pinkAccent,
        child: Center(

          child: Container(
            height: 500,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(20),
              boxShadow:[
                BoxShadow(
                  color: Colors.pinkAccent[100],
                  offset: Offset(-2, -2),
                  spreadRadius: 2,
                  blurRadius: 1

                ),
                BoxShadow(
                    color: Colors.pinkAccent[400],
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 2

                ),

              ]
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: Text(

                      "Admin Login",
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,fontSize: 25),
                      textAlign: TextAlign.center,

                    ),
                  ),

                  CustomAdminTextView(
                      Icons.font_download, "Enter Name", "Enter Name", _model, 1),
                  SizedBox(
                    height: 5,
                  ),
                  CustomAdminTextView(Icons.security, "Enter Password",
                      "Enter Password", _model, 2),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          databaseHelper.getAllPersons(context);

                          FocusScope.of(context).unfocus();

/*
                                Fluttertoast.showToast(
                                    msg: _detailModel.name,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIos: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);*/
                        }
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("Submit".toUpperCase(),
                          style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

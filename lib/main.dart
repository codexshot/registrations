import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:registrations/database/database.dart';
import 'package:registrations/model/detail_model.dart';
import 'package:registrations/widgets/custom_text_view.dart';
import 'package:registrations/widgets/date_picker.dart';

import 'pages/info_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int hour;

  DetailModel _detailModel = new DetailModel();
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Fill up the Forum for High School",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.black38,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CustomTextView(Icons.perm_identity, "Full Name",
                        "Enter Your Name", _detailModel),
                    CustomDatepicker(Icons.date_range, "Date of Birth", "dob"),
                    CustomTextView(
                        Icons.email, "Email", "Enter Your Email", _detailModel),
                    CustomTextView(Icons.alternate_email, "Alternate Email",
                        "Enter Your Alternate Email", _detailModel),
                    CustomTextView(Icons.favorite, "Interests",
                        "Enter Your Interests", _detailModel),
                    CustomTextView(Icons.book, "Trait",
                        "Enter Your Field of Expertise", _detailModel),
                    CustomTextView(Icons.add_location, "Location",
                        "Enter Your Location", _detailModel),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
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
                            dbHelper.database;
                            get_time();
                            _insert(
                                _detailModel.name, _detailModel.alternateEmail);
                            _detailModel.time = hour;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new InfoPage(_detailModel)),
                            );
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  get_time() {
    Random rnd = new Random();
    hour = 1 + rnd.nextInt(12 - 1);
  }

  void _insert(String name, String email) async {

    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnEmail: email
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }
}

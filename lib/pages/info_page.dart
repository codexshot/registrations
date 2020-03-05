import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registrations/animations/btn_animation.dart';
import 'package:registrations/database/database.dart';
import 'package:registrations/model/detail_model.dart';
import 'package:registrations/pages/admin_login.dart';
import 'package:registrations/pages/admin_page.dart';
import 'package:registrations/widgets/animate_btn.dart';
import 'package:registrations/widgets/detail_custom_textview.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class InfoPage extends StatefulWidget {
  DetailModel details;

  InfoPage(DetailModel detailModel) {
    this.details = detailModel;
  }

  @override
  _InfoPageState createState() => _InfoPageState(details);
}

class _InfoPageState extends State<InfoPage> {
  DetailModel _model;
  DateTime now = DateTime.now();
  final dbHelper = DatabaseHelper.instance;

  _InfoPageState(detailModel) {
    this._model = detailModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new IconButton(
              icon: new Icon(Icons.airplay, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) =>
                          AdminLogin()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.amberAccent,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.green, Colors.redAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 300 / 4,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          "Your Appointment",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                  ),
                  Custom_detail_text_view(Icons.perm_identity, _model.name),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                  ),
                  Custom_detail_text_view(Icons.location_on, _model.location),
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                  ),
                  Custom_detail_text_view(Icons.timer,
                      '${_model.time} pm, ${now.day + 1}/${now.month}/${now.year}'),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                  ),
                  AnimatedButton(),
                  Btn_Animation(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

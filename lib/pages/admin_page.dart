import 'package:flutter/material.dart';
import 'package:registrations/database/database.dart';

import '../model/personModel.dart';

class AdminPage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  List<Person> list;

  AdminPage(List<Person> list) {
    this.list = list;
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
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: new ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var postPone = list[index];
              return Container(
                width: double.infinity,
                height: 50,

                child: new Card(

                  color: Colors.amberAccent,
                  //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10.0),
                        top: Radius.circular(10.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${index+1}',
                            style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.assignment_ind,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Name",
                            style: TextStyle(fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,child: Container(
                          child: Text(
                            list[index].name.toUpperCase(),
                            style: TextStyle(fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }

/*   _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');

    allRows.forEach((row) => print(row));
   DetailModel model= new DetailModel();
   for(int i=0;i<allRows.length;i++){
     model.name=allRows.i
   }
  }*/

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registrations/api_call/response_detail.dart';
import 'package:registrations/model/Employee.dart';

class ProviderClass extends StatefulWidget {
  @override
  _ProviderClass createState() => _ProviderClass();
}

class _ProviderClass extends State<ProviderClass> {
  Future<Employee> employee;
  MyModel my_Model = new MyModel();
  bool visible = true;
  Color colorsss =Colors.white ;
  List<Data> selData = new List();
  List<bool> _selected = List.generate(25, (i) => false);

  void _changed(bool visibility) {
    setState(() {
      visible = visibility;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => my_Model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              visible
                  ? new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              color: Colors.green[200],
                              child: Consumer<MyModel>(
                                //                   <-----------consumer
                                builder: (context, my_Model, child) {
                                  return RaisedButton(
                                    child: Text('Hit api'),
                                    onPressed: () {
                                      my_Model.data.clear();
                                      employee =
                                          ApiCall().fetchEmployeeDetail();
                                      my_Model.doSomething(employee);
                                      _changed(false);
                                    },
                                  );
                                },
                              )),
                        ),
                      ],
                    )
                  : new Container(),
              Expanded(
                child: Container(
                  color: colorsss,
                    height: double.infinity,
                    child: Consumer<MyModel>(
                      //                    <--- Consumer
                      builder: (context, myModel, child) {
                        return new ListView.builder(
                            itemCount: my_Model.data.length,
                            itemBuilder: (context, index) {

                              return Dismissible(
                                background: Container(
                                  color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        "Remove",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ],
                                  ),
                                ),
                                key: Key(my_Model.data[index].employeeName),
                                onDismissed: (direction) {
                                  setState(() {
                                    my_Model.data.removeAt(index);
                                  });
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: _selected[index] ? Colors.blue[100] : null,
                                      child: ListTile(
                                        onTap: (){
                                          setState(() {
                                            setState(() => _selected[index] = !_selected[index]);
                                            selData.add(my_Model.data[index]);
                                            selData.toSet().toList();
                                          });


                                        },

                                        leading:
                                           Container(
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Icon(Icons.person),
                                            ),
                                          ),

                                        title:   Container(
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text(
                                                my_Model.data[index].employeeName,
                                                style:
                                                TextStyle(color: Colors.black),
                                              ),
                                          ),
                                        ),

                                      ),

                                    ),
                                    SizedBox(
                                      height: 10,
                                      width: double.infinity,
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier {
  MyModel();

  String Name;
  int Length = 0;
  List<Data> data = new List();

  void doSomething(Future<Employee> employee) {
    employee.whenComplete(() => (employee.asStream().forEach((element) {
          Name = element.data.elementAt(0).employeeName;
          data.addAll(element.data);
          Length = data.length;
          notifyListeners();

          print(Name);
        })));
  }
}

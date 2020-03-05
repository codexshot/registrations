

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:registrations/model/Employee.dart';

class ApiCall{
  
  ApiCall();

  Future<Employee> fetchEmployeeDetail() async {
    final response =
    await http.get('http://dummy.restapiexample.com/api/v1/employees');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      final jsonResponse = json.decode(response.body);
      Employee _employeeData = new Employee.fromJson(jsonResponse);
      return _employeeData;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to get Data');
    }
  }


}
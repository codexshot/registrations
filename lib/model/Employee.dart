class Employee {
  String _status;
  List<Data> _data;

  Employee({String status, List<Data> data}) {
    this._status = status;
    this._data = data;
  }

  String get status => _status;

  set status(String status) => _status = status;

  List<Data> get data => _data;

  set data(List<Data> data) => _data = data;

  Employee.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String _id;
  String _employeeName;
  String _employeeSalary;
  String _employeeAge;
  String _profileImage;

  Data(
      {String id,
      String employeeName,
      String employeeSalary,
      String employeeAge,
      String profileImage}) {
    this._id = id;
    this._employeeName = employeeName;
    this._employeeSalary = employeeSalary;
    this._employeeAge = employeeAge;
    this._profileImage = profileImage;
  }

  String get id => _id;

  set id(String id) => _id = id;

  String get employeeName => _employeeName;

  set employeeName(String employeeName) => _employeeName = employeeName;

  String get employeeSalary => _employeeSalary;

  set employeeSalary(String employeeSalary) => _employeeSalary = employeeSalary;

  String get employeeAge => _employeeAge;

  set employeeAge(String employeeAge) => _employeeAge = employeeAge;

  String get profileImage => _profileImage;

  set profileImage(String profileImage) => _profileImage = profileImage;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _employeeName = json['employee_name'];
    _employeeSalary = json['employee_salary'];
    _employeeAge = json['employee_age'];
    _profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['employee_name'] = this._employeeName;
    data['employee_salary'] = this._employeeSalary;
    data['employee_age'] = this._employeeAge;
    data['profile_image'] = this._profileImage;
    return data;
  }
}

class DetailModel {

  String _name,_email,_alternateEmail,_interests,_expertise,_location,_dob,_password;
  int _time,id;

  int get time => _time;

  set time(int value) {
    _time = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  get dob => _dob;

  set dob(value) {
    _dob = value;
  }

  get location => _location;

  set location(value) {
    _location = value;
  }

  get expertise => _expertise;

  set expertise(value) {
    _expertise = value;
  }

  get interests => _interests;

  set interests(value) {
    _interests = value;
  }

  get alternateEmail => _alternateEmail;

  set alternateEmail(value) {
    _alternateEmail = value;
  }

  set email(value) {
    _email = value;
  }




}
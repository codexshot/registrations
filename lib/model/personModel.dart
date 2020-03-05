
class Person {
  int id;
  String name;
  String email;

  Person({this.id, this.name, this.email});

  factory Person.fromMap(Map<String, dynamic> json) => new Person(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
  };
}


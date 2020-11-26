import 'package:firebase_database/firebase_database.dart';

class User{
  String key;
  String name;
  String surname;
  String department;


  User(this.name,this.surname,this.department);

  User.fromSnapshot(DataSnapshot snapshot) :
      key = snapshot.key,
      name=snapshot.value["name"],
      surname=snapshot.value["surname"],
      department=snapshot.value["department"];


  toJson(){
    return{
      "name": name,
      "surname": surname,
      "department": department,
    };
  }

}
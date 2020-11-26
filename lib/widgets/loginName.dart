
import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:service_app/models/user.dart';

class LoginName extends StatefulWidget{
  LoginName({this.userId});
  final String userId;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginNameState();
  }

}

class LoginNameState extends State<LoginName> {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;
  List<User> _userList;
  Query _userQuery;
  String nameSurname;


  @override
  void initState(){
    super.initState();

    _userList = new List();
    _userQuery = _database
        .reference()
        .child("user").orderByChild("uid").equalTo(widget.userId);


    _onTodoAddedSubscription = _userQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =_userQuery.onChildChanged.listen(onEntryChanged);
  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _userList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _userList[_userList.indexOf(oldEntry)] =
          User.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _userList.add(User.fromSnapshot(event.snapshot));
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // print(_userList[0].name);
    try{
      if(_userList.isNotEmpty){
        return Text(_userList[0].name + " " + _userList[0].surname);
      }
    }
    catch(e){
    }
    return Text(widget.userId);
  }
}

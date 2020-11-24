import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:service_app/models/user.dart';
import 'package:service_app/screens/endedWork.dart';
import 'package:service_app/screens/work.dart';
import 'package:service_app/services/auth.dart';
import 'package:service_app/widgets/show.dart';

class Home extends StatefulWidget{
  Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() {
    //print(auth);
    //print(logoutCallback);
    return HomeState();
  }

}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  List<User> _userList;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;
  Query _userQuery;



  @override
  void initState(){
    super.initState();
    tabController=new TabController(length: 3, initialIndex: 0, vsync: this);

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
     print("User List : $_userList");
     String ad;
     print(_userList.length);
     print(_userList[0].name);

    return Scaffold(
      appBar: new AppBar(
        title: new Text(_userList[0].name +" "+ _userList[0].surname),
        bottom: TabBar(
          controller: tabController,
          indicatorColor:Colors.white,
          tabs: <Widget>[
            // Tab(text:"Yeni Kayit", icon:Icon(Icons.add)),
            Tab(text: "İşler", icon:Icon(Icons.work)),
            Tab(text:"Bitenler",icon:Icon(Icons.done)),
            Tab(text:"Sorgular",icon:Icon(Icons.query_builder)),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Çıkış",
            style: new TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: (){
              print("Çıkış");
              signOut();
            },
          )
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          // Record(),
          Work(),
          EndedWork(),
          Text("Sorgular"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          show(context);
        },
        tooltip: "Kayıt Ekle",
        child: Icon(Icons.add),
      ),
    );
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
}

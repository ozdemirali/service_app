import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/screens/endedWork.dart';
import 'package:service_app/screens/search.dart';
import 'package:service_app/screens/work.dart';
import 'package:service_app/services/auth.dart';
import 'package:service_app/widgets/loginName.dart';
import 'package:service_app/widgets/showAddTodoDialog.dart';

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
  List<Job> _jobList;
  List<Job> _jobEnd;
  List<Job> _jobProcess;
  Query _jobQuery;


  final FirebaseDatabase _database=FirebaseDatabase.instance;

  StreamSubscription<Event> _onJobAddedSubscription;
  StreamSubscription<Event> _onJobChangedSubscription;




  @override
  void initState(){
    super.initState();
    tabController=new TabController(length: 3, initialIndex: 0, vsync: this);

    _jobList=new List();

    _jobQuery=_database
              .reference()
              .child("job");

    _onJobAddedSubscription=_jobQuery.onChildAdded.listen(onEntryAdded);
    _onJobChangedSubscription=_jobQuery.onChildChanged.listen(onEntryChanged);


  }

  @override
  void dispose(){
    _onJobAddedSubscription.cancel();
    _onJobChangedSubscription.cancel();
    super.dispose();
  }

  onEntryAdded(Event event){
    setState(() {
      _jobList.add(Job.fromSnapshot(event.snapshot));
    });
  }

  onEntryChanged(Event event){
    var oldEntry=_jobList.singleWhere((entry){
      return entry.key==event.snapshot.key;
    });

    setState(() {
      _jobList[_jobList.indexOf(oldEntry)]=
          Job.fromSnapshot(event.snapshot);

    });
  }

  // addNewTodo(String todoItem) {
  //   if (todoItem.length > 0) {
  //     Todo todo = new Todo(todoItem.toString(), widget.userId, false);
  //     _database.reference().child("todo").push().set(todo.toJson());
  //   }
  // }

  // updateTodo(Todo todo) {
  //   //Toggle completed
  //   todo.completed = !todo.completed;
  //   if (todo != null) {
  //     _database.reference().child("todo").child(todo.key).set(todo.toJson());
  //   }
  // }

  // deleteTodo(String todoId, int index) {
  //   _database.reference().child("todo").child(todoId).remove().then((_) {
  //     print("Delete $todoId successful");
  //     setState(() {
  //       _todoList.removeAt(index);
  //     });
  //   });
  // }


  @override
  Widget build(BuildContext context) {
   if(_jobList.length>0){
      _jobEnd= _jobList.where((s)=>s.status=="end").toList();
      _jobProcess=_jobList.where((s)=>s.status!="end").toList();
     print(_jobEnd.length);
     print(_jobProcess.length);
   }
   else{

   }

 

    return Scaffold(
      appBar: new AppBar(
        title: new LoginName(userId: widget.userId),
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
          Work(
              jobProcess:_jobProcess ,
          ),
          EndedWork(
            jobEnd: _jobEnd,
          ),
          Search(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddTodoDialog(context);
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

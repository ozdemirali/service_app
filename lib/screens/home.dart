import 'package:flutter/material.dart';
import 'package:service_app/screens/endedWork.dart';
import 'package:service_app/screens/work.dart';
import 'package:service_app/services/auth.dart';
import 'package:service_app/widgets/loginName.dart';
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


  @override
  void initState(){
    super.initState();
    tabController=new TabController(length: 3, initialIndex: 0, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

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

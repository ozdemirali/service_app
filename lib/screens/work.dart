import 'package:flutter/material.dart';

class Work extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WorkState();
  }

}

class WorkState extends State<Work>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        listWork(),
      ],
    );
  }

  Widget listWork(){
    return new Container(
      padding:EdgeInsets.fromLTRB(0, 2, 0, 0),
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("M"),
              ),
              title:Text("Sistem kurulacak. Formatlayınız"),
              subtitle: Text("Ayşe Tek"),
              onTap: (){
                print("Seçildi");
              },
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("Mob"),
              ),
              title:Text("Sistem kurulacak. Formatlayınız"),
              subtitle: Text("Ayşe Tek"),
              onTap: (){
                print("Seçildi");
              },
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("Mak"),
              ),
              title:Text("Sistem kurulacak. Formatlayınız"),
              subtitle: Text("Ayşe Tek"),
              onTap: (){
                print("Seçildi");
              },
            ),
          ),
        ],
      ),
    );
  }
}
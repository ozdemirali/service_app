import 'package:flutter/material.dart';
import 'package:service_app/widgets/showDetail.dart';

Widget list(BuildContext context){
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
              showDetail(context);
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
              showDetail(context);
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
              showDetail(context);
              showDetail(context);
              print("Seçildi");
            },
          ),
        ),
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:service_app/screens/home.dart';
import 'package:service_app/screens/login.dart';
import 'package:service_app/screens/root.dart';
import 'package:service_app/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Teknik Servis Programı",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Root(auth: new Auth()),
    );
  }
}
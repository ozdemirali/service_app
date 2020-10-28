import 'package:flutter/material.dart';

import 'login.dart';

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
      home: Login(),
    );
  }
}
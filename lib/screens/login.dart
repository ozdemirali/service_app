import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Teknik Servis Takip"),
      ),
      body: Stack(
        children: <Widget>[
          showForm(),
        ],
      ),
    );
  }

  Widget showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
          ],
        ),
      ),
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: "Logo",
      child: new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset("images/service.jpg"),
        ),
      ),
    );
  }
}

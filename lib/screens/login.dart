import 'package:flutter/material.dart';
import 'package:service_app/mixins/validation_mixin.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<Login> with ValidaionMixin {
  final formKey = new GlobalKey<FormState>();
  String email;
  String password;
  String errorMessage;

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
        key: formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showLoginButton(),
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

  Widget showEmailInput(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration:  new InputDecoration(
          hintText: 'E-mail',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
        validator:validateEmail,
        onSaved: (value){

        },
      ),
    );
  }

  Widget showPasswordInput(){
    return new Padding(
      padding:const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Şifreniz',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
        validator: validatePassword,
        onSaved: (value){

        },
      ),
    );
  }

  Widget showLoginButton(){
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
              ),
              color: Colors.blue,
              child: new Text("Giriş",
                style:new TextStyle(fontSize: 20.0, color: Colors.white)),
              onPressed: (){
                if(formKey.currentState.validate()){
                  print("submit");
                }

              }),
        ),
    );
  }



}

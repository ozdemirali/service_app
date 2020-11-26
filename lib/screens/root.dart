import 'package:flutter/material.dart';
import 'package:service_app/services/auth.dart';

import 'home.dart';
import 'login.dart';

enum AuthStatus {
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class Root extends StatefulWidget{
  Root({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() {
    return RootState();
  }

}

class RootState extends State<Root> {

  AuthStatus authStatus=AuthStatus.NOT_LOGGED_IN;
  String userId="";

@override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user){
      setState(() {
        if(user!=null){
          userId=user?.uid;
        }
        authStatus=user?.uid==null ? AuthStatus.NOT_LOGGED_IN:AuthStatus.LOGGED_IN;
      });
    });
  }


  void loginCallback(){
  widget.auth.getCurrentUser().then((user){
    setState(() {
      userId=user.uid.toString();
    });
  });
  setState(() {
    authStatus=AuthStatus.LOGGED_IN;
  });
  }

  void logoutCallBack(){
  setState(() {
    authStatus=AuthStatus.NOT_LOGGED_IN;
    userId="";
  });
  }

  // Widget buildWaitingScreen() {
  //   return Scaffold(
  //     body: Container(
  //       alignment: Alignment.center,
  //       child: CircularProgressIndicator(),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {

     switch (authStatus){

       case AuthStatus.NOT_LOGGED_IN:
         return Login(
           auth: widget.auth,
           loginCallback: loginCallback,
         );
         break;

       case AuthStatus.LOGGED_IN:
         if(userId.length >0 && userId!=null){
           return Home(
             userId: userId,
             auth: widget.auth,
             logoutCallback: logoutCallBack,
           );
         }else
           return Login(
             auth: widget.auth,
             loginCallback: loginCallback,
           );
           break;

       default:
         return Login(
           auth: widget.auth,
           loginCallback: loginCallback,
         );
     }
  }
}


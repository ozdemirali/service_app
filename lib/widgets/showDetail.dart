import 'package:flutter/material.dart';
import 'package:service_app/widgets/showDetailForm.dart';

showDetail(BuildContext context){
  Dialog simpleDialog=Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      // width:MediaQuery.of(context).size.width,
      //height: 600,
      padding: EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
            child: showDetailForm(context),
          ),
        ],
      ),
    ),
  );

   showDialog(context: context,builder: (BuildContext context )=>simpleDialog);

}
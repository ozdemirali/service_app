import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/widgets/showDetailForm.dart';

showDetail(BuildContext context){
  Dialog simpleDialog=Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Container(
      //width:MediaQuery.of(context).size.width,
      //height: 600,
      padding: EdgeInsets.all(0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: showDetailForm(context),
          ),
         /* Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Kapat",
                    style:TextStyle(fontSize: 18.0,color: Colors.white) ,
                  ),
                ),
              ],
            ),
          ),*/

        ],
      ),
    ),
  );

   showDialog(context: context,builder: (BuildContext context )=>simpleDialog);

}
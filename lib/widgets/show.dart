import 'package:flutter/material.dart';
import 'package:service_app/widgets/showDetailForm.dart';

show(BuildContext context){
   showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height -  80,
            padding: EdgeInsets.all(2),
            color: Colors.white,
            child: showDetailForm(context),
            // child: Column(
            //   children: [
            //     RaisedButton(
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       child: Text(
            //         "Save",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       color: const Color(0xFF1BC0C5),
            //     )
            //   ],
            // ),
          ),
        );
      });

}
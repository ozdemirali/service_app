import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/widgets/list.dart';

class Work extends StatefulWidget{

  final List<Job> jobProcess;
  Work({this.jobProcess});



  @override
  State<StatefulWidget> createState() {
    //print(jobProcess.length);
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
        Listeleme(context,widget.jobProcess),
      ],
    );
  }


}
import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/widgets/list.dart';

class EndedWork extends StatefulWidget{

  final List<Job> jobEnd;
  EndedWork({this.jobEnd});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EndedWorkState();
  }

}

class EndedWorkState extends State<EndedWork>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Listeleme(context,widget.jobEnd),
      ],
    );
  }
}
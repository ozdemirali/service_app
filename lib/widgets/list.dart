import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/widgets/showAddTodoDialog.dart';

Widget Listeleme(BuildContext context,List<Job> jobs){
var renk=new List(jobs.length);


  return new Container(
    padding:EdgeInsets.fromLTRB(0, 2, 0, 0),
    child:ListView.builder(
        itemCount: jobs.length,
        itemBuilder:(BuildContext context,int position){
           return Card(
             color: Colors.white,
             elevation: 2.0,
             child: ListTile(
               leading: CircleAvatar(
                 backgroundColor: jobs[position].status=="end"?Colors.blue:jobs[position].status=="new"?Colors.red:Colors.yellow,
                 child: Text(jobs[position].department.substring(0,3)),
               ),
               title:Text(jobs[position].description),
               subtitle:Text(jobs[position].bringPerson),
               onTap: (){
                 //show(context);
                 showAddTodoDialog(context);
                 print("Seçildi");
               },
             ),
           );
        }),
  );

}




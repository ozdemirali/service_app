import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/widgets/showAddTodoDialog.dart';

final FirebaseDatabase _database=FirebaseDatabase.instance;

Widget Listeleme(BuildContext context,List<Job> jobs){
var renk=new List(jobs.length);


  return new Container(
    padding:EdgeInsets.fromLTRB(0, 2, 0, 0),
    child:ListView.builder(
       shrinkWrap: true,
        itemCount: jobs.length,
        itemBuilder:(BuildContext context,int position){
           return Dismissible(
             key: Key(jobs[position].key),
             background: Container(color:Colors.red),
             onDismissed: (direction) async{
               deleteJob(jobs[position].key,position);
             },
             child: Card(
               color: Colors.white,
               elevation: 2.0,
               child: ListTile(
                 leading: CircleAvatar(
                   backgroundColor: jobs[position].status=="Bitti"?Colors.blue:jobs[position].status=="Yeni"?Colors.red:Colors.yellow,
                   child: Text(jobs[position].department.substring(0,3)),
                 ),
                 title:Text(jobs[position].description),
                 subtitle:Text(jobs[position].bringPerson),
                 onTap: (){
                   //show(context);
                   showAddTodoDialog(context,jobs[position]);
                   print("Seçildi");
                 },
               ),
             ),
           );
        }),
  );


}
deleteJob(String jobId,int index) {
  print(jobId);
  _database.reference().child("job").child(jobId).remove().then((_){
  });
}




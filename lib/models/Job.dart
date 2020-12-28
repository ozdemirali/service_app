import 'package:firebase_database/firebase_database.dart';

class Job{
  String key;
  String squareCode;  //kare kod
  String department;  //bölümü
  String description; //iş tanımı
  String explanation; //iş açıklaması
  String doneWork;    //yapılan iş
  String doneUser;    //yapan kişi
  String bringPerson; //iş getiren
  String status;      //iş durumu
  String shelf;       //bulunduğu raf


  Job(this.squareCode,this.department,this.description,this.explanation,this.doneWork,this.doneUser,this.bringPerson,this.status,this.shelf);

  Job.fromSnapshot(DataSnapshot snapshot) :
        key=snapshot.key,
        squareCode=snapshot.value["squareCode"],
        department=snapshot.value["department"],
        description=snapshot.value["description"],
        explanation=snapshot.value["explanation"],
        doneWork=snapshot.value["doneWork"],
        doneUser=snapshot.value["doneUser"],
        bringPerson=snapshot.value["bringPerson"],
        status=snapshot.value["status"],
        shelf=snapshot.value["shelf"];

  toJson(){
    return {
      "squareCode":squareCode,
      "department":department,
      "description":description,
      "explanation":explanation,
      "doneWork":doneWork,
      "doneUser":doneUser,
      "bringPerson":bringPerson,
      "status":status,
      "shelf":shelf,
    };
  }
}
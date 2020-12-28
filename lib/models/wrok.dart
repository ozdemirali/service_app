import 'package:firebase_database/firebase_database.dart';

class Work{
  String key;
  String squareCode;  //kare kod
  String department;  //bölümü
  String jobDescription; //iş tanımı
  String jobExplanation; //iş açıklaması
  String jobDoneUser;      //yapan kişi
  String jobBring;        //iş getiren
  String jobStatus;       //iş durumu
  String shelf;          //bulunduğu raf


  Work(this.squareCode,this.department,this.jobDescription,this.jobExplanation,this.jobDoneUser,this.jobBring,this.jobStatus,this.shelf);

  Work.fromSnapshot(DataSnapshot snapshot) :
      key=snapshot.key,
      squareCode=snapshot.value["squareCode"],
      department=snapshot.value["department"],
      jobDescription=snapshot.value["jobDescription"],
      jobExplanation=snapshot.value["jobExplanation"],
      jobDoneUser=snapshot.value["jobDoneUser"],
      jobBring=snapshot.value["jobBring"],
      jobStatus=snapshot.value["jobStatus"],
      shelf=snapshot.value["shelf"];

  toJson(){
    return {
      "squareCode":squareCode,
      "department":department,
      "jobDescription":jobDescription,
      "jobExplanation":jobExplanation,
      "jobDoneUser":jobDoneUser,
      "jobBring":jobBring,
      "jobStatus":jobStatus,
      "shelf":shelf,
    };
  }
}
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/models/Job.dart';
import 'package:service_app/screens/home.dart' as home;

TextEditingController txtSquareCode=new TextEditingController();
TextEditingController txtBringPerson=new TextEditingController();
TextEditingController txtDescription=new TextEditingController();
TextEditingController txtExplanation=new TextEditingController();
TextEditingController txtShelf =new TextEditingController();
TextEditingController txtDoneWork=new TextEditingController();
TextEditingController txtDoneUser=new TextEditingController();

String selectDepartment;
String selectStatus;

List<String> department=["Bilişim","Kimya","Makine","Mobilya","Metal","Otomasyon","İdare"];
List<String> status=["Yeni","Yapılıyor","Bitti"];

final FirebaseDatabase _database=FirebaseDatabase.instance;

int secim=2;


showAddTodoDialog(BuildContext context,Job data) async {

  //print(data);

 if(data.squareCode!=""){
   txtSquareCode.text=data.squareCode;
   txtBringPerson.text=data.bringPerson;
   txtDescription.text=data.description;
   txtExplanation.text=data.explanation;
   txtShelf.text=data.shelf;
   txtDoneWork.text=data.doneWork;
   txtDoneUser.text=data.doneUser;
   selectDepartment=data.department;
   selectStatus=data.status;
 }
 else{
   txtSquareCode.text="";
   txtBringPerson.text="";
   txtDescription.text="";
   txtExplanation.text="";
   txtShelf.text="";
   txtDoneWork.text="";
   txtDoneUser.text="";
   selectDepartment="Bilişim";
   selectStatus="Yeni";
 }

  final _formKey = GlobalKey<FormState>();


  await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left:5,right: 5),
          title: Center(
            child: Text("Bilgi Düzenleme")
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          content:Container(
            height:MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                       squareCodeInput(),
                       Department(),
                       bringPersonInput(),
                       descriptionInput(),
                       explanationInput(),
                       shelfInput(),
                       doneWorkInput(),
                       doneWorkUser(),
                       Status(),

                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                child:const Text('İptal'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child:data.squareCode==""? const Text('Kaydet'):const Text("Güncelle"),
                onPressed: () {
                  //print("eeee");
                  if (_formKey.currentState.validate()){
                    print(data.squareCode);
                        if(data.squareCode==""){
                          secim=1;
                        }
                    data.squareCode=txtSquareCode.text;
                    data.department=selectDepartment;
                    data.bringPerson=txtBringPerson.text;
                    data.description=txtDescription.text;
                    data.explanation=txtExplanation.text;
                    data.shelf=txtShelf.text;
                    data.doneWork=txtDoneWork.text;
                    data.status=selectStatus;

                      if(secim==1) {
                        addNewJob(data);
                      }
                      else{
                        updateJob(data);
                      }

                    //print(txtSquareCode.text);
                    Navigator.pop(context);
                  }

                })
          ],
        );
      });
}


addNewJob(Job data) {

  //print("add new job");
  //print(data.squareCode);
  //print(data.status);

  if (data !=null) {
    Job job=new Job(data.squareCode, data.department, data.description, data.explanation, data.doneWork, data.doneUser, data.bringPerson, data.status, data.shelf);
    //Todo todo = new Todo(todoItem.toString(), widget.userId, false);
    _database.reference().child("job").push().set(job.toJson());
  }

}



updateJob(Job job) {
  if (job !=null) {
    _database.reference().child("job").child(job.key).set(job.toJson());
  }

}

deleteJob(String jobId) {
  print(jobId);
  _database.reference().child("job").child(jobId).remove().then((_){
  });
}




Widget squareCodeInput() {
  return  TextFormField(
        controller:txtSquareCode,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "SquareCode",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget bringPersonInput() {
  return  TextFormField(
        controller:txtBringPerson,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Getiren Kişi",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget descriptionInput() {
  return TextFormField(
        controller:txtDescription,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "İş Tanımı",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget explanationInput() {
  return TextFormField(
        controller:txtExplanation,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "İşin Açıklaması",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget shelfInput() {
  return  TextFormField(
        controller:txtShelf,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Bulunduğu Raf",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget doneWorkInput() {
  return  TextFormField(
        controller:txtDoneWork,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Yapılan İş",
          //hintText: "e.g Morgan",
        ),
        validator: (value){
          if (value.isEmpty) {
            return "Ad alanı dolu olmalı";
          }
          return null;
        },
        textInputAction: TextInputAction.next,
      );
}

Widget doneWorkUser() {
  return  TextFormField(
    controller:txtDoneUser,
    textCapitalization: TextCapitalization.words,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: "Yapılan İş",
      //hintText: "e.g Morgan",
    ),
    validator: (value){
      if (value.isEmpty) {
        return "Ad alanı dolu olmalı";
      }
      return null;
    },
    textInputAction: TextInputAction.next,
  );
}


//Department
class Department extends StatefulWidget{
  @override
  _DepartmentState createState()=>_DepartmentState();
}

class _DepartmentState  extends State<Department>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButtonFormField<String>(
        value: selectDepartment,
        items: department
            .map((label) => DropdownMenuItem(
          child: Text(label),
          value: label,
        )).toList(),
        onChanged: (value){
          setState(() {
            selectDepartment=value;
          });
        },
      );

  }
}


class Status extends StatefulWidget{
  @override
  _StatusState createState()=>_StatusState();
}

class _StatusState  extends State<Status>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButtonFormField<String>(
        value: selectStatus,
        items: status
            .map((label) => DropdownMenuItem(
          child: Text(label),
          value: label,
        )).toList(),
        onChanged: (value){
          setState(() {
            selectStatus=value;
          });
        },
      );
  }
}










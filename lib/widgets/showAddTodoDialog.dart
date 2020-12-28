import 'package:flutter/material.dart';

TextEditingController txtSquareCode=new TextEditingController();
TextEditingController txtBringPerson=new TextEditingController();
TextEditingController txtDescription=new TextEditingController();
TextEditingController txtExplanation=new TextEditingController();
TextEditingController txtShelf =new TextEditingController();
TextEditingController txtDoneWork=new TextEditingController();
String selectDepartment;
String selectStatus;

List<String> department=["Bilişim","Kimya","Makine","Mobilya","Metal","Otomasyon","İdare"];
List<String> status=["Yeni Geldi","İşlem devam ediyor","Bitti"];


showAddTodoDialog(BuildContext context) async {
  final _formKey = GlobalKey<FormState>();
  selectDepartment="Bilişim";
  selectStatus="Yeni Geldi";

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
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                }),
            new FlatButton(
                child: const Text('Save'),
                onPressed: () {
                  //addNewTodo(_textEditingController.text.toString());
                  if (_formKey.currentState.validate()){
                    print("save");
                    print(txtSquareCode.text);
                    //Navigator.pop(context);
                  }

                })
          ],
        );
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
        controller:txtDescription,
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
        controller:txtShelf,
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










import 'package:flutter/material.dart';
import 'package:service_app/mixins/validation_mixin.dart';

class Record extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecordState();
  }

}

class RecordState extends State<Record> with ValidaionMixin {
  final formKey=new GlobalKey<FormState>();
  int _value=1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        showForm(),
      ],
    );
  }

  Widget showForm(){
    return new Container(
      padding:EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: new Form(
        key: formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showIdInput(),
            showPersonInput(),
            showDeviceProblemInput(),
            showDeviceType(),
            showDepartmentInput(),
            showRecordButton(),

          ],
        ),
      ),
    );
  }

  Widget showIdInput(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: true,
        decoration: new InputDecoration(
          hintText: "Karekod Giriniz",
        ),
        validator:validateInput,
        onSaved: (value){
        },
      ),
    );
  }

  Widget showPersonInput(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: "Getiren Kişi",
        ),
        validator:validateInput,
        onSaved: (value){
        },
      ),
    );
  }

  Widget showDeviceProblemInput(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: "Problemi yazınız",
        ),
        validator:validateInput,
        onSaved: (value){
        },
      ),
    );
  }


  Widget showDeviceType(){
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(0.0),
        child: DropdownButtonFormField<int>(
          value:_value ,
          items: [
            DropdownMenuItem(
              child: Text("Kasa"),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text("Monitör"),
              value: 2,
            ),
            DropdownMenuItem(
                child: Text("Yazıcı"),
                value: 3
            ),
            DropdownMenuItem(
                child: Text("Kamera"),
                value: 4
            ),
          ],
          hint: Text("Alanınız Seçiniz"),
          onChanged: (value){
            setState(() {
              _value=value;
              print(_value);
            });
          },
        ),
      ),
    );
  }


  Widget showDepartmentInput(){
    return new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(0.0),
          child: DropdownButtonFormField<int>(
            value:_value ,
            items: [
              DropdownMenuItem(
                child: Text("Bilişim"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Kimya"),
                value: 2,
              ),
              DropdownMenuItem(
                  child: Text("Metal"),
                  value: 3
              ),
              DropdownMenuItem(
                  child: Text("Mobilya"),
                  value: 4
              ),
            ],
            hint: Text("Alanınız Seçiniz"),
            onChanged: (value){
              setState(() {
                _value=value;
                print(_value);
              });
            },
          ),
        ),
    );
  }

  Widget showRecordButton(){
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)
            ),
            color: Colors.blue,
            child: new Text("Kayıt",
                style:new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: (){
              if(formKey.currentState.validate()){
                print("submit");
              }

            }),
      ),
    );
  }
}
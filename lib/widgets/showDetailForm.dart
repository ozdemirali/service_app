import 'package:flutter/material.dart';

Widget showDetailForm(context) {
  return new Scaffold(
      body:showForm(context));
}


Widget showForm(BuildContext context){
  return new Container(
    padding:EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: new Form(
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          showBarcode(),
          showDepartment(),
          showRelatedPerson(),
          showWorkDescription(),
          showProblem(),
          showShelf(),
          showWorkDone(),
          showStatus(),
          showButton(context),
        ],
      ),
    ),
  );
}

Widget showBarcode(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      enabled: false,
      decoration: new InputDecoration(
        hintText: "Karekod Giriniz",
      ),
      onSaved: (value){
      },
    ),
  );
}

Widget showDepartment(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      enabled: false,
      decoration: new InputDecoration(
        hintText: "Makine",
      ),
      onSaved: (value){
      },
    ),
  );
}
Widget showRelatedPerson(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      enabled: false,
      decoration: new InputDecoration(
        hintText: "Ayşe Tek",
      ),
      onSaved: (value){
      },
    ),
  );
}

Widget showWorkDescription(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      enabled: false,
      decoration: new InputDecoration(
        hintText: "Xp Kurulacak",
      ),
      onSaved: (value){
      },
    ),
  );
}

Widget showProblem(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      enabled: false,
      decoration: new InputDecoration(
        hintText: "İşletim sistemindeki bazı dosyalar bozuk",
      ),
      onSaved: (value){
      },
    ),
  );
}


//Raf kayıt formunu gösteren widget
Widget showShelf(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "1.Raf 2.Sıra",
      ),
      onSaved: (value){
      },
    ),
  );
}

Widget showWorkDone(){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      obscureText: false,
      autofocus: true,
      decoration: new InputDecoration(
        hintText: "İşletim sistemindeki bazı dosyalar bozuk",
      ),
      onSaved: (value){
      },
    ),
  );
}







Widget showStatus(){
  int _value=1;
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
    child: Container(
      //width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0.0),
      child: DropdownButtonFormField<int>(
        value:_value ,
        items: [
          DropdownMenuItem(
            child: Text("Bitti"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("İşlem Devam ediyor"),
            value: 2,
          ),
          DropdownMenuItem(
              child: Text("Parçe Bekleniyor"),
              value: 3
          ),
        ],
        onChanged: (value){
          print("seçildi");
        },
      ),
    ),
  );
}


Widget showButton(BuildContext context){
  return new Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(2.0),
            child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(2.0)
                ),
                color: Colors.blue,
                child: new Text("Geri",
                    style:new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: (){
                  Navigator.of(context).pop();
                  print("submit");

                }
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(2.0),
            child: RaisedButton(
                elevation: 5.0,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(2.0)
                ),
                color: Colors.blue,
                child: new Text("Kayıt",
                    style:new TextStyle(fontSize: 20.0, color: Colors.white)),
                onPressed: (){
                    print("submit");

                }
            ),
          ),
        ),
      ],
    ),
  );
}





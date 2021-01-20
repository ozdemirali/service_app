# service_app

A new Flutter application.

## Dependencies

firebase_auth: ^0.14.0+5
  firebase_database: ^3.0.7
  flutter_barcode_scanner: ^1.0.1

## Getting Started

Realtime Database of Firebase is used on this project
Database is below as Json
 
{
  "department" : [ null, {
    "name" : "Bilişim"
  }, {
    "name" : "Metal"
  }, {
    "name" : "Elektrik ve Elektronik"
  }, {
    "name" : "Kimya"
  }, {
    "name" : "Makine"
  }, {
    "name" : "Mobilya"
  }, {
    "name" : "Motor"
  }, {
    "name" : "Otomasyon"
  }, {
    "name" : "İdare"
  } ],
  
  "job" : {
    "-MNoDEZxRhF8j5VuACKv" : {
      "bringPerson" : "Serkan Uçar",
      "department" : "Kimya",
      "description" : "Windows kurulacak",
      "doneUser" : "Test Test",
      "doneWork" : "Ram bekliyor",
      "explanation" : "Ekrana görinti gelmiyor",
      "shelf" : "1.Raf",
      "squareCode" : "dfdfgdfg",
      "status" : "Yeni"
    }
  },
  
  "status" : [ null, {
    "name" : "Yeni"
  }, {
    "name" : "Yapılıyor"
  }, {
    "name" : "Bitti"
  } ],
  
  "user" : [ null, {
    "department" : "Bilişim Teknolojileri",
    "name" : "Test",
    "surname" : "T",
    "uid" : "mit1qWObAIaeqjJSiWu9mo4OAfm1"
  } ]
}

Screens are below

![Login Screen](https://user-images.githubusercontent.com/20681737/105218301-08f50800-5b66-11eb-92b6-92d34824694f.png)
![Work List Screen](https://user-images.githubusercontent.com/20681737/105218299-085c7180-5b66-11eb-943a-586b2d172b5d.png)
![Finished Work Screen](https://user-images.githubusercontent.com/20681737/105218300-085c7180-5b66-11eb-8e74-f05f3e7f3ed9.png)
![Query Work Screen](https://user-images.githubusercontent.com/20681737/105218294-07c3db00-5b66-11eb-95c2-13dc9a175107.png)
![New Record Screen](https://user-images.githubusercontent.com/20681737/105218304-08f50800-5b66-11eb-8d0e-760c89d648f2.png)
![Record Edit Screen](https://user-images.githubusercontent.com/20681737/105218298-085c7180-5b66-11eb-9e5a-a788d73efcf6.png)



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

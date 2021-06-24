import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: hayvankayit(title: 'Flutter Demo Home Page'),
    );
  }
}

class hayvankayit extends StatefulWidget {
  hayvankayit({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _hayvankayitState createState() => _hayvankayitState();
}

class _hayvankayitState extends State<hayvankayit> {

  var refHayvanlar = FirebaseDatabase.instance.reference().child("Yeni Kullanıcı Kaydı");

  Future<void> hayvanEkle() async {
    var bilgi = HashMap<String,dynamic>();
    bilgi["kullanici_ad"] = "İbrahim SEVEN";
    bilgi["kullanici_cinsi"] = "Erkek";
    bilgi["kullanici_yas"] = "35";
    refHayvanlar.push().set(bilgi);
  }
  Future<void> hayvanSil() async {
    refHayvanlar.child("-McvYz77XELLHKlVyhIR").remove();
  }

  Future<void> hayvanGuncelle() async {
    var guncelbilgi = HashMap<String,dynamic>();
    guncelbilgi["kullanici_ad"] = "Meltem Koç";
    guncelbilgi["kullanici_cinsi"] = "bayan";
    guncelbilgi["kullanici_yas"] = "10";

    refHayvanlar.child("-MNJxnDhaVhfjU2v0suR").update(guncelbilgi);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hayvanEkle();
    //hayvanSil();
    //hayvanGuncelle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('KULLANICI KAYIT EKRANI'),
        backgroundColor: Colors.brown,

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            Image.asset("Resimler/giris_icon.png", width: 200, height: 100),
            TextField(
              textAlign: TextAlign.justify,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              onChanged: (text) {

              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(),
                filled: true,
                fillColor: Color(0xff964b00),
                hintText: "  Kullanıcı Adınız..",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                focusColor: Color(0xffffffff),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            TextField(
              textAlign: TextAlign.justify,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              onChanged: (text) {

              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(),
                filled: true,
                fillColor: Color(0xff964b00),
                hintText: "Cinsiyet",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                focusColor: Color(0xffffffff),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            TextField(
              textAlign: TextAlign.justify,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              onChanged: (text) {

              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(),
                filled: true,
                fillColor: Color(0xff964b00),
                hintText: "Yaşınız..",
                hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                focusColor: Color(0xffffffff),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),

            ),
            RaisedButton(
              onPressed:() { ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text(" BAŞARI İLE KAYDEDİLDİ..."),
            duration: Duration(seconds: 3)),
            );},
              color: Colors.brown,
              child:
              Text("VeriTabanına Kaydet",style: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold)),
            ),

          ],
        ),
      ),


    );
  }
}




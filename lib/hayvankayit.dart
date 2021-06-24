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

  var refHayvanlar = FirebaseDatabase.instance.reference().child("Hayvanlar_Tablosu");

  Future<void> hayvanEkle() async {
    var bilgi = HashMap<String,dynamic>();
    bilgi["hayvan_ad"] = "Koyun";
    bilgi["hayvan_cinsi"] = "Erkek";
    bilgi["hayvan_tur"] = "Memeli";
    refHayvanlar.push().set(bilgi);
  }
  Future<void> hayvanSil() async {
    refHayvanlar.child("-McvYz77XELLHKlVyhIR").remove();
  }

  Future<void> hayvanGuncelle() async {
    var guncelbilgi = HashMap<String,dynamic>();
    guncelbilgi["hayvan_ad"] = "Keçi";
    guncelbilgi["hayvan_Cinsi"] = "Dişi";
    guncelbilgi["hayvan_tur"] = "Memeli";

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
      appBar: AppBar(
        title: Text('Hayvan Kaydı Başarılı.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}




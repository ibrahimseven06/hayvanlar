import 'package:hayvanlar/Anasayfa.dart';
import 'package:hayvanlar/hata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hayvanlar/kuslar.dart';
import 'package:hayvanlar/memeliler.dart';
import 'package:hayvanlar/degerlendirme.dart';
import 'package:flutter/material.dart';
import 'package:hayvanlar/bitir.dart';
import 'package:hayvanlar/hakkinda.dart';
import 'package:hayvanlar/surungenler.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //durum değiştikçe
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hayvanları Tanıyalım',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lime,
        //primaryColor: Colors.amberAccent
        //primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/Anasayfa': (context) => Anasayfam(),
        '/degerlendirme': (context) => Degerlendirme(),
        '/bitir': (context) => Bitir(),
        '/hakkinda': (context) => Hakkinda(),
        '/hata': (context) => Hata(),
        '/kuslar': (context) => Kuslar(),
        '/memeliler': (context) => Memeliler(),
        '/surungenler': (context) => Surungenler(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String adSoyad = '';
  // String ogrNo = '';

  void kontrol() {
    if (adSoyad.length > 5) {
      var data = [];
      data.add(adSoyad);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Anasayfam(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    } else {
      var data = [];
      data.add(adSoyad);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Hata(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    }
  }

  void _adSoyadKaydet(String text) {
    setState(() {
      adSoyad = text;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'HAYVANLARI TANIYALIM',
            style: GoogleFonts.rancho(fontSize: 25.0, color: Colors.white)
         // style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        //leading: new IconButton(icon:Icon(Icons.home_sharp) , iconSize: 40, tooltip: 'AnaSayfa', onPressed: (){},),
      ),


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "Resimler/giris_arkaplan.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              /*Text(
                "HAYVANLARI TANIYALIM",
                style: GoogleFonts.pacifico()
              ),*/
              Image.asset("Resimler/giris_icon.png", width: 100, height: 100),
              Text(
                'Oyuncu Adınız(NickName)..',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //
                  width: 175,
                  height: 36,
                  child: TextField(

                    textAlign: TextAlign.justify,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    onChanged: (text) {
                      _adSoyadKaydet(text);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(),
                      filled: true,
                      fillColor: Color(0xff964b00),
                      hintText: "  Oyuncu Adınızı Giriniz..",
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                      focusColor:Color(0xffffffff) ,



                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff964b00), // background
                    onPrimary: Colors.red, // foreground
                  ),
                  // onPressed: () { },
                  onPressed: kontrol,

                  child: Text(
                    'GİRİŞ İÇİN TIKLAYINIZ..',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

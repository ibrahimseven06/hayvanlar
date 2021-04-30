import 'package:hayvanlar/hata.dart';
import 'package:hayvanlar/kuslar.dart';
import 'package:hayvanlar/memeliler.dart';
import 'package:hayvanlar/degerlendirme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hayvanlar/bitir.dart';
import 'package:hayvanlar/hakkinda.dart';
import 'package:hayvanlar/menu.dart';
//import 'package:hayvanlar/hayvanlar.dart';
import 'package:hayvanlar/surungenler.dart';
import 'package:hayvanlar/menu.dart';
import 'package:google_fonts/google_fonts.dart';

class Anasayfam extends StatefulWidget {
  @override
  _AnasayfamState createState() => _AnasayfamState();
}

class _AnasayfamState extends State<Anasayfam> {
  String adSoyad = '';


  @override
  Widget build(BuildContext context) {

    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];

    return Scaffold(
     backgroundColor: Colors.blueGrey[100],

      drawer: Yanmenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: 'MENÜ',
            );
          },
        ),



        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title:
        Text('HOŞGELDİN   $adSoyad ', style: GoogleFonts.rancho(fontSize: 25.0, color: Colors.white),
        ),



        //leading: new IconButton(icon:Icon(Icons.home_sharp) , iconSize: 40, tooltip: 'AnaSayfa', onPressed: (){},),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.info_outline) ,iconSize: 40,tooltip: 'Görüş ve Öneriler', onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Görüş ve Önerileriniz için--> ibrahimseven81@gmail.com adresine mail atabilirsiniz...')));
          },
          )
        ],
      ),

      body:Center(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Resimler/anasayfa.jpg",),
              fit: BoxFit.fill,
            ),
          ),

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Text(""),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff964b00), // background
                      onPrimary: Colors.white, // foreground
                    ),

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Kuslar(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );

                    },

                    child: Text('KUŞLAR'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(


                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff964b00), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    // onPressed: () { },

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Surungenler(),
                          settings: RouteSettings(
                            arguments: data,

                          ),
                        ),
                      );
                    },

                    child: Text('SÜRÜNGENLER'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff964b00), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    // onPressed: () { },

                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Memeliler(),
                          settings: RouteSettings(
                            arguments: data,

                          ),
                        ),
                      );
                    },

                    child: Text('MEMELİ HAYVANLAR'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),

                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff964b00), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    // onPressed: () { },



                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Degerlendirme(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );

                    },
                    child: Text('BİRAZ PRATİK YAPALIM', style: TextStyle(color: Colors.white),),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),

    );


  }
}

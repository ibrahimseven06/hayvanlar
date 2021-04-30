import 'package:flutter/material.dart';


class Hata extends StatefulWidget {
  @override
  _HataState createState() => _HataState();
}

class _HataState extends State<Hata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'DİKKAT!!!',
          style: TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        leading: new IconButton(
          icon: Icon(Icons.home_sharp),
          iconSize: 40,
          tooltip: 'Giriş Ekranı',
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mail),
            iconSize: 40,
            tooltip: 'İletişim',
            onPressed: () {
              Navigator.pushNamed(context, '/iletisim');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "Resimler/anasayfa.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text("                   ", style: TextStyle(fontSize: 110.0),),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:60.0),
                child: Text(" "),
                ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical:5.0),
                child: Image.asset("Resimler/dikkat.png", width: 150, height: 75),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'OYUNCU ADINIZ(NİCKNAME) \n EN AZ 6 KARAKTER OLMALIDIR!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff964b00), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('GİRİŞ SAYFASINA DÖN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BaseLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bulb.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Anasayfa.dart';

class Iletisim extends StatefulWidget {
  @override
  _IletisimState createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  String adSoyad = '';

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown,
          title: Text('İletişim'),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  Image.asset(
                    "Resimler/iletisim.png",
                    // width: 300,
                    // height: 150
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 45.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    color: Colors.brown[900],
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.mail, color: Colors.white),
                          //SizedBox(width: 8.0,),
                          Text(
                            'ibrahimseven81@gmail.com',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 45.0,
                    ),
                    padding: EdgeInsets.all(10.0),
                    color: Colors.brown[900],
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.white),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          '0544 253 34 16',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff964b00), // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Anasayfam(),
                            settings: RouteSettings(
                              arguments: data,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Anasayfaya Dön',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

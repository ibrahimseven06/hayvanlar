import 'package:flutter/material.dart';
import 'Anasayfa.dart';


class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {

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

          title: Text('Hakkında'),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 10.0,),
                  Container(
                      width: 600,
                      child: Divider(height: 5, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3311456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 203311102 numaralı Öğrenci İbrahim SEVEN tarafından 25 Haziran 2021 günü yapılmıştır.',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                      width: 600,
                      child: Divider(height: 5, color: Colors.black)),
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

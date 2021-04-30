import 'package:flutter/material.dart';

import 'Anasayfa.dart';

class Bitir extends StatefulWidget {
  @override
  _BitirState createState() => _BitirState();
}

class _BitirState extends State<Bitir> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
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
              Text(' ',
                  style: TextStyle(fontSize: 110.0)),

              Text(
                'OYUNCU ADINIZ: ' + data[0].toString(), style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold
              ),
              ),


              Text(
                "                   ",
                style: TextStyle(fontSize: 20.0),
              ),
              Text('PUANINIZ: ' + data[1].toString(),style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold
              ),),

              Text(
                "                   ",
                style: TextStyle(fontSize: 20.0),
              ),

              Text('KULLANILAN SÜRE: ' + data[2].toString(),style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold
              ),),

              Text(
                "                   ",
                style: TextStyle(fontSize: 20.0),
              ),

              Text('                          '),
              ElevatedButton(
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
                      ));
                },
                child: Text('Anasayfaya Dön', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

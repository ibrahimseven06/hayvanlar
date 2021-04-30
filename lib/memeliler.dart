import 'Anasayfa.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Memeliler extends StatefulWidget {
  @override
  _MemelilerState createState() => _MemelilerState();
}

class _MemelilerState extends State<Memeliler> {
  String adSoyad = '';

  int hayvanNo = 1;
  List<String> hayvan_aciklama=[
    'ASLAN',
    'AT',
    'CEYLAN',
    'ÇİTA',
    'DEVE',
    'KEÇİ',
    'KEDİ',
    'KİRPİ',
    'PANDA',
    'SİNCAP',
    'TİLKİ',
    'YARASA',
    'ZEBRA',
    'ZÜRAFA',

  ];

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
          backgroundColor: Colors.lightBlueAccent,
          title: Text('MEMELİ HAYVANLAR'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
             /* Text(
                'Hayvanları Tanıyalım,',
                style: TextStyle(fontSize: 60.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),*/
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    padding: const EdgeInsets.all(0.0),

                    //color: Colors.white,
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    //focusColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        hayvanNo=Random().nextInt(14)+1;

                      });

                    },
                    child: Image.asset('Resimler/Memeliler/hayvan_$hayvanNo.jpg'),
                  ),
                ),
              ),
              Container(
                  width: 400,
                  child: Divider(height: 5, color: Colors.black)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  hayvan_aciklama[hayvanNo-1],
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green;
                        return null; // Use the component's default.
                      },
                    ),
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
                  child: Text('Anasayfaya Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

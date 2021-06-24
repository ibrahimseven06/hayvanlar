import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hayvanlar/Anasayfa.dart';

class Kuslar extends StatefulWidget {
  @override
  _KuslarState createState() => _KuslarState();
}

class _KuslarState extends State<Kuslar> {

  String adSoyad = '';

  int hayvanNo = 1;
  List<String> hayvan_aciklama=[
    'KAZ',
    'BAYKUŞ',
    'CİVCİV',
    'GÜVERCİN',
    'ARI KUŞU',
    'HOROZ',
    'KARGA',
    'LEYLEK',
    'ÖRDEK',
    'PAPAĞAN',
    'PENGUEN',
    'TAVUK',

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

          title: Text('KUŞLAR'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                    //color: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    highlightColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        hayvanNo=Random().nextInt(12)+1;

                      });

                      // var aciklama='Arıkuşu hakkında bilgi verilecek...';
                    },
                    child: Image.asset('Resimler/Kuslar/hayvan_$hayvanNo.jpg'),
                  ),
                ),
              ),
              Container(
                  width: 400,
                  child: Divider(height: 5, color: Colors.black)),
              Text(
                hayvan_aciklama[hayvanNo-1],
                style: TextStyle(fontSize: 20),
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
                    //Navigator.pushNamed(context, '/Anasayfa');

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

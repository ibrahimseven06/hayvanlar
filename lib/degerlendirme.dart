//import 'dart:convert';
import 'dart:async';
import 'package:hayvanlar/bitir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Degerlendirme extends StatefulWidget {
  @override
  _DegerlendirmeStage createState() => _DegerlendirmeStage();
}

String zamaniFormatla(int milisaniye) {
  var saniye = milisaniye ~/ 1000; // ~/ Tam sayı bölme işlemidir
  var dakika = ((saniye % 3600) ~/ 60).toString().padLeft(2, '0');
  var saniyeler = (saniye % 60).toString().padLeft(2, '0');
  return "$dakika:$saniyeler";
}

class _DegerlendirmeStage extends State<Degerlendirme> {
  String adSoyad = '';


  int mevcutsoru = 0;
  String mevcutcevap = '';
  int puan = 0;
  int kullanilansure = 0;

  Stopwatch _sayac;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _sayac = Stopwatch();
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {});
    });
    mevcutsoru = 0;
    mevcutcevap = '';
    puan = 0;
    kullanilansure = 0;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void BitireYolla(){
    var data = [];
    data.add(adSoyad);

    data.add(puan.toString());
    data.add(zamaniFormatla(kullanilansure));
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bitir(),
          settings: RouteSettings(
            arguments: data,
          ),
        ));
  }

  var degerlendirme = [
    {
      'soru': 'Aşağıdakilerden hangisi memeli hayvandır?',
      'cevaplar': ['Tavuk', 'Yılan', 'Kedi'],
      'dogrucevap': 'Kedi'
    },
    {
      'soru': 'Aşağıdakilerden hangisi sürüngendir?',
      'cevaplar': ['Horoz', 'Yılan', 'Aslan'],
      'dogrucevap': 'Yılan'
    },
    {
      'soru': 'Aşağıdakilerden hangisi kuşdur?',
      'cevaplar': ['Fil', 'Horoz', 'Timsah'],
      'dogrucevap': 'Horoz'
    },
    {
      'soru': 'Aşağıdakilerden hangisi sürüngen değildir?',
      'cevaplar': ['Fil','Yılan', 'Komoda Ejderi' ],
      'dogrucevap': 'Fil'
    },
    {
      'soru': 'Aşağıdakilerden hangisi memeli hayvandır?',
      'cevaplar': ['Yılan', 'Zürafa', 'Arı Kuşu'],
      'dogrucevap': 'Zürafa'
    },
    {
      'soru':  'Aşağıdakilerden hangisi sürüngen hayvandır?',
      'cevaplar': ['Aslan', 'Salyangoz', 'Bukalemun'],
      'dogrucevap': 'Salyangoz'
    },
    {
      'soru':   'Aşağıdakilerden hangisi sürüngen hayvan değildir?',
      'cevaplar': ['Yılan', 'Yarasa','Kaplunbağa' ],
      'dogrucevap': 'Yarrasa'
    },
    {
      'soru': 'Aşağıdakilerden hangisi memeli hayvan değildir?',
      'cevaplar': ['Kedi', 'Yarasa','Kaplumbağa'],
      'dogrucevap': 'Kaplumbağa'
    },
    {
      'soru': 'Hangi hayvan memeli hayvan değildir?',
      'cevaplar': ['Deve','Penguen', 'Yarasa'],
      'dogrucevap': 'Penguen'
    },
    {
      'soru': 'Aşşağıdakilerden hangisi memeli hayvandır?',
      'cevaplar': ['Kirpi', 'Yılan', 'Arı Kuşu'],
      'dogrucevap': 'Kirpi'
    },
  ];

  void kontrolEt() {
    if (mevcutsoru > 8) {
      mevcutsoru = 0;
      _timer.cancel();
      BitireYolla();
    } else {
      if (mevcutcevap == degerlendirme[mevcutsoru]['dogrucevap']) {
        puan = puan + 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      } else {
        puan = puan - 10;
        mevcutsoru++;
        kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
        _sayac.reset();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _sayac.start();
    if (_sayac.elapsedMilliseconds > 9999 && mevcutsoru < 9) {
      kullanilansure = kullanilansure + _sayac.elapsedMilliseconds;
      _sayac.reset(); // 10 saniyede cevap verilmezse diğer soruya geçiyor
      mevcutsoru++;
    }

    if (mevcutsoru == 9 && _sayac.elapsedMilliseconds > 9999) {
      Future.delayed(Duration.zero, () async {
        _sayac.reset(); // Sıfırlama
        _sayac.stop(); // Bitiş ekranına geldik artık
        _timer.cancel(); // Yeni ekrana geçtiğinde saymayı bitirsin
        mevcutsoru = 0;
        BitireYolla();
      });
    }

    List cevaplistesi = [];
    for (var u in degerlendirme[mevcutsoru]['cevaplar']) {
      cevaplistesi.add(u);
    }

    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];

    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text('KENDİMİZİ DEĞERLENDİRELİM ',style: GoogleFonts.rancho(fontSize: 25.0, color: Colors.white),
        ),

      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Resimler/sorular.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('OYUNCU ADINIZ: \n' + adSoyad, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold
              ),
                  textAlign: TextAlign.center,
                  ),

              Text(
                'SORU NO: '+ mevcutsoru.toString() +'/' +
                  degerlendirme.length.toString(),
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold
                ),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'PUAN: ' + puan.toString(),
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                  width: 400,
                  child: Divider(height: 5, color: Colors.black)),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  degerlendirme[mevcutsoru]['soru'].toString(),
                  style: TextStyle(color: Color(0xff964b00), fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff964b00), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    setState(() {
                      mevcutcevap = cevaplistesi[0].toString();
                    });
                    kontrolEt();
                  },

                  child: Text(
                    cevaplistesi[0],
                    style: TextStyle(fontSize: 24),
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff964b00), // background
                    onPrimary: Colors.white, // foreground
                  ),


                  onPressed: () {
                    setState(() {
                      mevcutcevap = cevaplistesi[1].toString();
                    });
                    kontrolEt();
                  },
                  child: Text(
                    cevaplistesi[1],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff964b00), // background
                    onPrimary: Colors.white, // foreground
                  ),

                  onPressed: () {
                    setState(() {
                      mevcutcevap = cevaplistesi[2].toString();
                    });
                    kontrolEt();
                  },
                  child: Text(
                    cevaplistesi[2],
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Container(
                  width: 400,
                  child: Divider(height: 5, color: Colors.black)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(zamaniFormatla(_sayac.elapsedMilliseconds),
                    style: TextStyle(fontSize: 50.0)),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('Kullanılan Süre: ' + zamaniFormatla(kullanilansure),
                    style: TextStyle(color: Colors.red, fontSize: 20.0 , fontWeight: FontWeight.bold
                    ), ),
              ),
              /*Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Anasayfa');
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

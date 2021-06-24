import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class dosyaIslemleri extends StatefulWidget {
  @override
  _dosyaIslemleriState createState() => _dosyaIslemleriState();
}

class _dosyaIslemleriState extends State {
  //dosyaYolunu oluşturulması

  Future<String> get getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return dosya.path;
  }

  //Dosyanın oluşturulması
  Future get dosyaOlustur async {
    var dosyakonumu = await getDosyaYolu;
    return File(dosyakonumu + "/olusturulandosya.txt");
  }

  //dosyaya yazma işlemi
  Future dosyaYaz(String dosyaninIcerigi) async {
    var myDosya = await dosyaOlustur;

    return myDosya.writeAsString(dosyaninIcerigi);
  }

  //dosyayı okuma
  Future<String> okunacakDosya() async {
    try {
      var myDosya = await dosyaOlustur;

      String dosyaicergi = myDosya.readAsStringSync();
      return dosyaicergi;
    } catch (exception) {
      debugPrint("HATA :$exception");
    }
  }

  //Form Field'dan Input alabilmemiz için controller yapısı
  TextEditingController mycontroller = TextEditingController();

  //Dosyaya yazılan veriyi ekranda gösterebilmek için gerekli degişken
  var gosterilecekDeger = "";

  //Snackbar'ı kullanabilmek için gerekli key
  var key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Görüş ve Önerileriniz"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Resimler/öneriler.png",
              width: 400,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                controller: mycontroller,
                maxLines: 2,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(),
                  filled: true,
                  hintText: "Buraya yazılacak degerler dosya ya kaydedilir",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 16,
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: _Yaz,
                    color: Colors.green,
                    child: Text("Dosya'ya Yaz"),
                  ),
                  RaisedButton(
                    onPressed: _Oku,
                    color: Colors.orange,
                    child: Text("Dosya'dan oku"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "$gosterilecekDeger",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _Yaz() async {
    dosyaYaz(mycontroller.text.toString()).then((value) {
      setState(() {
        gosterilecekDeger = value.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("ÖNERİNİZ BAŞARI İLE KAYDEDİLDİ..."),
            duration: Duration(seconds: 3)),
      );
    });
  }

  void _Oku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        gosterilecekDeger = deger;
        debugPrint("$gosterilecekDeger");
      });
    });
  }
}

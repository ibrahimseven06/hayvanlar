import 'package:flutter/material.dart';
import 'package:hayvanlar/Anasayfa.dart';
import 'package:hayvanlar/hayvankayit.dart';
import 'package:hayvanlar/istatistik.dart';
import 'package:hayvanlar/degerlendirme.dart';
import 'package:hayvanlar/hayvanDestek.dart';
import 'package:hayvanlar/hakkinda.dart';
import 'package:hayvanlar/iletisim.dart';
import 'package:hayvanlar/sokakDostlari.dart';
import 'package:hayvanlar/oneriler.dart';

class Yanmenu extends StatefulWidget {
  @override
  _YanmenuState createState() => _YanmenuState();
}

class _YanmenuState extends State<Yanmenu> {
  String adSoyad = '';
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;
    adSoyad = data[0];

    return Container(
      padding: EdgeInsets.only(top: 55), //üstten boşluk bırakma
      child: Drawer(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0), //her taraftan 20 boşluk
              color: Colors.blueGrey.shade50,
              child: Image.asset('Resimler/ustlogo.png'), height: 100,width: 300,
            ),
            Expanded(

              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Anasayfa',),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Anasayfam(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Hayvan Dostlarımız'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Test(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Neler Yapabiliriz?'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => animasyonsayfasi2(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('İstatistikler'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Istatistik(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Hayvan Kayıt'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hayvankayit(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('İletişim'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Iletisim(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Görüş ve Öneriler'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => dosyaIslemleri(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Değerlendirme'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Degerlendirme(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );

                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Hakkında'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Hakkinda(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

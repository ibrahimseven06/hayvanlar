import 'package:flutter/material.dart';
import 'package:hayvanlar/Anasayfa.dart';
import 'package:hayvanlar/degerlendirme.dart';
import 'package:hayvanlar/hakkinda.dart';

import 'package:hayvanlar/kuslar.dart';
import 'package:hayvanlar/memeliler.dart';
import 'package:hayvanlar/surungenler.dart';

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
              padding: EdgeInsets.all(20.0), //her taraftan 20 boşluk
              color: Colors.blueGrey.shade50,
              child: Image.asset('Resimler/ustlogo.png'),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[

                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Anasayfa'),
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
                    title: Text('Kuşlar'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Kuslar(),
                          settings: RouteSettings(
                            arguments: data,
                          ),
                        ),
                      );
                      },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Sürüngenler'),
                    onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Surungenler(),
                        settings: RouteSettings(
                          arguments: data,
                        ),
                      ),
                    );
                      },
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_forward_sharp),
                    title: Text('Memeliler'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Memeliler(),
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

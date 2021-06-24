import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hayvanlar/Anasayfa.dart';


class Istatistik extends StatefulWidget {
  @override
  _IstatistikState createState() => _IstatistikState();
}

class _IstatistikState extends State<Istatistik> {
  String adSoyad = '';
  int touchedIndex = -1;

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

          title: Text('İSTATİSTİKLER'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[

                 Image.asset(
                  "Resimler/istatistik.jpg",
                  width: 350,
                  height: 150,

                ),

              SizedBox(
                height: 12.0,
              ),Text(
                'TÜRKİYE EN ÇOK KUŞ BESLEMEYİ SEVİYOR...',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              //const SizedBox(
              // height: 18,
              // ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                          setState(() {
                            final desiredTouch = pieTouchResponse.touchInput is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                            if (desiredTouch && pieTouchResponse.touchedSection != null) {
                              touchedIndex = pieTouchResponse.touchedSection.touchedSectionIndex;
                            } else {
                              touchedIndex = -1;
                            }
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 70,
                        sections: showingSections()),
                  ),
                ),
              ),
              Text(
                "Türkiye’de evlerde en çok beslenen hayvanların başında kuşlar geliyor.Evde hayvan beslediğini söyleyen kişilerden %33’ü kuş, %32 kedi cevabını verdi. Bunu %22 ile köpek ve %13 ile balıklar takip etti.",
                style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 33,
            title: '33% ',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 32,
            title: '32% ',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 22,
            title: '22% ',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 13,
            title: '13% ',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
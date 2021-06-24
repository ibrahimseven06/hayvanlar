import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class animasyonsayfasi2 extends StatefulWidget {
  @override
  _animasyonsayfasiState2 createState() => _animasyonsayfasiState2();
}

class _animasyonsayfasiState2 extends State<animasyonsayfasi2> {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 40.0,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("SOKAKTAKİ DOSTLARIMIZ"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Onlar Bize Emanet!",
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Horizon',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 600,
                    child: Divider(height: 10, color: Colors.black)),
                AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'HAYVANLARI SEVELİM',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                    ColorizeAnimatedText(
                      'HAYVANLARI KORUYALIM',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                    ColorizeAnimatedText(
                      'MUTLU BİR',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                    ColorizeAnimatedText(
                      'GELECEK SAĞLAYALIM ',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                    ColorizeAnimatedText(
                      'SEVGİMİZİ ÇOĞALTALIM',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                Container(
                    width: 600,
                    child: Divider(height: 10, color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.black,
                  height: 220,
                  width: 305,
                  alignment: Alignment.center,
                  child: Image.asset('Resimler/hayvandestek1.jpg',
                      width: 300, height: 300),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 600,
                    child: Divider(height: 10, color: Colors.black)),
                Text(
                  "NELER YAPABİLİRİZ?",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Horizon',
                      color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                Container(
                    width: 600,
                    child: Divider(height: 10, color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Kimsesiz bir hayvanı sahiplenebilirsiniz.',
                      textStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    TypewriterAnimatedText(
                      'Yenidoğan ve bakıma muhtaç yavruların bakımını üstlenebilirsiniz',
                      textStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    TypewriterAnimatedText(
                      'Barınaklara bağışta bulunabilirsiniz',
                      textStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    TypewriterAnimatedText(
                      'Uygun yerlere bir kap mama bir kap su bırakabilirsiniz',
                      textStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("HAYVANLARI SEVELİM-KORUYALIM");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

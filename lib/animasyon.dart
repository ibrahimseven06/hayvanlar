import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class animasyonsayfasi extends StatefulWidget {
  @override
  _animasyonsayfasiState createState() => _animasyonsayfasiState();
}

class _animasyonsayfasiState extends State<animasyonsayfasi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'Agne',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "HAYVANLARI KORUYALIM", style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 20.0,),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('MUTLU BİR GELECEK SAĞLAYALIM'),
                TypewriterAnimatedText('SEVGİMİZİ ÇOĞALTALIM'),
                TypewriterAnimatedText('Kimsesiz bir hayvanı sahiplenebilirsiniz.'),
                TypewriterAnimatedText('Yenidoğan ve bakıma muhtaç yavruların bakımını üstlenebilirsiniz'),

              ],
              onTap: () {
                print("HAYVANLARI SEVELİM-KORUYALIM");
              },
            ),

            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Kimsesiz bir hayvanı sahiplenebilirsiniz.'),
                TypewriterAnimatedText('Yenidoğan ve bakıma muhtaç yavruların bakımını üstlenebilirsiniz'),

              ],
              onTap: () {
                print("NELER YAPABİLİRİZ");
              },
            ),


          ],
        ),
      ),
    );
  }
}
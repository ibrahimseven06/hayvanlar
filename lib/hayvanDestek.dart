import 'package:flutter/material.dart';


class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Color color = Colors.red;
  Image img;
// example: Image.asset('images/camera.png',)

  Image imgIlk =  Image.asset('Resimler/hayvandestek1.jpg',width: 300,
      height: 300);
  Image imgTek =  Image.asset('Resimler/hayvandestek2.jpg',width: 300,
      height: 300);
  Image imgCift =  Image.asset('Resimler/hayvandestek3.jpg',width: 300,
      height: 300);


  @override
  void initState() {
    super.initState();
    img = imgIlk;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sokak Dostlarımız'),
        centerTitle: true,
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: img,
              onTapDown: (tap){
                setState(() {
                  // when it is pressed
                  img =  imgTek;

                });
              },
              onDoubleTap: (){
                setState(() {
                  // when it is released
                  img = imgCift;
                });
              },
              onLongPress: (){
                setState(() {
                  img = imgIlk;
                });
              },

            ),
          GestureDetector(
              onTap: (){
                setState(() {
                  color = Colors.blue;
                });
              },
              onDoubleTap: (){
                setState(() {
                  color = Colors.green;
                });
              },
              onHorizontalDragStart: (DragStartDetails details){
                setState(() {
                  color = Colors.white;
                });
              },
              onHorizontalDragEnd: (DragEndDetails details){
                setState(() {
                  color = Colors.blueGrey;
                });
              },
              onVerticalDragStart: (DragStartDetails details){
                setState(() {
                  color = Colors.orange;
                });
              },
              onVerticalDragEnd: (DragEndDetails details){
                print(details.primaryVelocity);
                setState(() {
                  color = Colors.yellow;
                });
              },
              onLongPress: (){
                setState(() {
                  color = Colors.red;
                });
              },
              child:Container(color: color, height: 200, width: 300,

                child:Text(
                  'Sokaktaki dostlarımız için bir fikrimiz var!',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),

              )

          ),

          ],

        )

      ),
    );
  }
}
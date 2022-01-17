import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

/*

class CurvePainterContainer extends StatefulWidget {
  final int myId;
  final String myCountry; // Not used here
  const CurvePainterContainer(this.myId, this.myCountry);

  @override
  _CurvePainterContainerState createState() => _CurvePainterContainerState();
}

class _CurvePainterContainerState extends State<CurvePainterContainer> {
  ui.Image myImage;
  bool isImageLoaded = false;
  //String linPink= 'assets/images/canvas/pic9.jpg';

  List<String> linPink = [
    'assets/images/canvas/pic1.jpg',
    'assets/images/canvas/pic2.jpg',
    'assets/images/canvas/pic3.jpg',
    'assets/images/canvas/pic4.jpg',
    'assets/images/canvas/pic5.jpg',
    'assets/images/canvas/pic6.jpg',
    'assets/images/canvas/pic7.jpg',
    'assets/images/canvas/pic8.jpg',
    'assets/images/canvas/pic9.jpg',
    'assets/images/canvas/pic10.jpg',
    'assets/images/canvas/pic11.jpg',
  ];

  /*
    void initState() {
    super.initState();
    init();
  }
   */


  /*
    Widget proverb(int index) {
    return FutureBuilder(
        future: init(), //ICI changement pays
        builder: (context, snapshot) {
          return MaterialApp(
            home: Scaffold(
              body: Image.asset(linPink[widget.myId]), //   <--- image
            ),
          );
        });
  }
   */

  //Get image
  Future<Null> init() async {
    //final ByteData data = await rootBundle.load(linPink[2]);
    // final ByteData data = await rootBundle.load(linPink[widget.myId]);
    //myImage = await loadImage(Uint8List.view(data.buffer));

    final ByteData data = await rootBundle.load(linPink[1]);
    myImage = await loadImage(Uint8List.view(data.buffer));
  }

  //Load image
  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {
        isImageLoaded = true;
      });
      return completer.complete(img);
    });
    return completer.future;
  }

  Widget _buildImage() {
    if (this.isImageLoaded) {
      return CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 400), //400 = height
        painter: ImageEditor(image: myImage),
      );
    } else {
      //return Center(child: Text('loading'));
      Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('MenuCanvas : ${widget.myId}'); //Number index OK
    print('MenuCanvas : ${linPink[widget.myId]}'); //link to pic OK

    /*
        return Container(
      child: _buildImage(),
    );
     */

    RefreshIndicator(
        onRefresh: init,
        child: Container(
          child: _buildImage(),
        ),
    );

  }
}

//Canvas creation
class ImageEditor extends CustomPainter {
  ui.Image image;
  ImageEditor({
    this.image,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lightBlue.withOpacity(0.8);
    paint.style = PaintingStyle.fill; // Change this to fill
    paint.shader = ImageShader(image, TileMode.repeated, TileMode.repeated,
        Matrix4.identity().scaled(2.0).storage);

    var path = Path();
    path.moveTo(0, size.height * 1.380);
    path.quadraticBezierTo(size.width * 0.25, size.height * 1.700,
        size.width * 0.5, size.height * 1.400);
    path.quadraticBezierTo(size.width * 0.75, size.height * 1.100,
        size.width * 1.0, size.height * 1.150);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

 */

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//Canvas creation
//Save
/*
class CurvePainterContainer extends CustomPainter {
  /*
    ui.Image image;
  ImageEditor({
    this.image,
  });
   */

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lightBlue.withOpacity(0.2);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.moveTo(0, size.height * 0.767);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.675, size.width * 0.6, size.height * 0.8167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.884, size.width * 1.0, size.height * 0.817);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
 */




class CurvePainterContainer extends CustomPainter {
  /*
    ui.Image image;
  ImageEditor({
    this.image,
  });
   */

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.lightBlue.withOpacity(0.2);
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.moveTo(0, size.height * 0.467);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.475, size.width * 0.6, size.height * 0.816);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.984, size.width * 1.0, size.height * 1.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

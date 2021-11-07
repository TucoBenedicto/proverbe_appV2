import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';

class CurvePainterContainer extends StatefulWidget {
  @override
  _CurvePainterContainerState createState() => _CurvePainterContainerState();
}

class _CurvePainterContainerState extends State<CurvePainterContainer> {
  ui.Image myImage; //Ici myImage est typé "objet".
  bool isImageLoaded = false;

  void initState() {
    super.initState();
    init();
  }

  //Recuperation du lien de  l'image que l'on integre a la variable "myImage"
  Future<Null> init() async {
    final ByteData data = await rootBundle.load('assets/images/canvas/pic9.jpg');
    //Pic9 , pic8 , pic7 , pic4: ok
    myImage = await loadImage(Uint8List.view(data.buffer));
  }

  //methode de Chargement de l'image avec l'aide d'un futur
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

  // Condition : Creation d'une barre de chargement tant que l'image n'est pas chargée
  Widget _buildImage() {
    if (this.isImageLoaded) {
      return CustomPaint(
        size: Size(MediaQuery.of(context).size.width, 400), //200 = height
        painter: ImageEditor(image: myImage),
      );
    } else {
      //return Center(child: Text('loading'));
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildImage(),
    );
  }
}

//Creation du canvas (la forme)
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:typed_data';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';

class BackGround extends StatefulWidget {
  final PageController pageController1;
  BackGround({this.pageController1});

  @override
  _BackGroundState createState() => new _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  int myId = 0;
  String myCountry;
  ui.Image myImage;
  bool isImageLoaded = false;
  String countryName; //à delette

  Proverb jsonGetter;
  String assetsPic;

  @override
  //start "init()" in first
  void initState() {
    super.initState();
    //pageController1
    init();
  }

  //Methode 1 get image with Array
  /*
        List<String> imageList = [
    'assets/images/canvas/pic1.jpg',
    'assets/images/canvas/pic2.jpg',
    'assets/images/canvas/pic3.jpg',
    'assets/images/canvas/pic4.jpg',
    'assets/images/canvas/pic5.jpg',
  ];
   */

  //Get image
  Future<Null> init() async {
//Get the image link from json thanks to the functiion "loadItemMenu" in th mixin "HelperFunction.dart "
    jsonGetter = await loadItemMenu(myId);
    assetsPic = jsonGetter.assetsCanvas; //assetsCanvas is in the Json file
    final ByteData data = await rootBundle.load(assetsPic);
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

  Widget background() {
    if (this.isImageLoaded) {
      return IgnorePointer(
        //Desactivation du slide avec les doigts
        child: PageView.builder(
          pageSnapping: true,
          controller: widget.pageController1,
          itemCount: assetsPic.length,
          onPageChanged: (index) {
            setState(() {
              myId = index;
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Image.asset(
                //'${imageList[index]}',
                '${assetsPic}',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
        //return Center(child: Text('loading'));
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    init();
    return background();
  }
}

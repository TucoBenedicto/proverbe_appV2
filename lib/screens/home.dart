import 'package:flutter/material.dart';

import '../widgets/Menu/Menu.dart';
import '../widgets/Proverb/proverbDisplay.dart';
import '../widgets/Background/MenuCanvas.dart';
import '../widgets/Background/background.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create fields to store the current `myId` and current `myMenu`, si je ne met pas "0" et "Random" j'ai une erreur "null".
  int myId = 0;
  String myCountry; //Not used here
  PageController pageController1 = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:

            //ROW 1 //Affichage Menu
            Stack(
          children: <Widget>[
            BackGround(pageController1: pageController1),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  height: 1000,
                  child: CustomPaint(painter: CurvePainterContainer())),
            ),
            PageViewItem(
                onChanged: (newMyId, newMyCountry, newpageController1) {
              setState(() {
                myId = newMyId;
                myCountry = newMyCountry;
                pageController1.animateToPage(myId,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.bounceInOut);
                //print("myId from main.dart : $myId");
              });
            }),
            ProverbDisplay(myId, myCountry),
          ],
        ),
      ),
    );
  }
}

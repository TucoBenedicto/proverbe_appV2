import 'package:flutter/material.dart';

//import 'package:projet1_proverbe_v2/utils/mixins/CountryModelClass.dart';


import '../widgets/Menu/Menu.dart';
import '../widgets/Proverb/proverbDisplay.dart';
import '../widgets/Background/MenuCanvas.dart';
import '../widgets/Background/background.dart';
import '../widgets/Menu/Menu.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/HelperFunction.dart';

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
      home:

      Scaffold(
        body:

            //ROW 1 //Affichage Menu
            Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                BackGround(pageController1:pageController1),

                //SizedBox(height: 150),

                //ProverbDisplay(myId, myCountry),


                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: double.infinity,
                      height: 1000,
                      child: CustomPaint(painter: CurvePainterContainer())),
                ),


                PageViewItem(onChanged: (newMyId, newMyCountry ,newpageController1) {
                  setState(() {
                    myId = newMyId;
                    myCountry = newMyCountry;
                    pageController1.animateToPage(myId, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
                    //print("myId from main.dart : $myId");
                  });
                }),



                ProverbDisplay(myId, myCountry),



              ],

            ),
           // SizedBox(height: 10),
            //ROW 2 //AFFICHAGE des proverbes
        /*
                    Column(
              //Expanded(// permet a son contenu de prendre toute la place horyzontal disponible , puisque on a autiliser un " width: double.infinity, "
              //permet de centrer le Row
              mainAxisAlignment: MainAxisAlignment.center,
              //myCountry= 'Random';
              /*
                            children: <Widget>[
                ProverbDisplay(myId, myCountry),
              ],
               */

            ),
         */



            /*
                        Align(
              alignment: Alignment.bottomCenter,
              //alignment: Alignment.topCenter,
              child: Container(
                  width: double.infinity,
                  height: 200,
                  child: CustomPaint(painter: CurvePainterContainer())),
            ),
             */






      ),



    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:projet1_proverbe_v2/utils/mixins/CountryModelClass.dart';
import '../widgets/Menu.dart';
import '../widgets/proverbDisplay.dart';
import '../widgets/MenuCanvas.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create fields to store the current `myId` and current `myMenu`, si je ne met pas "0" et "Random" j'ai une erreur "null".
  int myId = 0;
  //String myCountry = 'Random' ;
  InterestsModel country  ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(children: <Widget>[
            //ROW 1 //Affichage Menu
            //SizedBox(height: 100),
            Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CurvePainterContainer(),

                PageViewItem(

                    onChanged: ( newMyId,  newMyMenu) {
                  setState(() {
                    myId = newMyId;
                    myCountry = newMyMenu;
                  });
                }

                ),
                // _buildCheckIcon(),
              ],
            ),
            SizedBox(height: 100),
            //ROW 2 //AFFICHAGE des proverbes
            Row(
              //Expanded(// permet a son contenu de prendre toute la place horyzontal disponible , puisque on a autiliser un " width: double.infinity, "
              //permet de centrer le Row
              mainAxisAlignment: MainAxisAlignment.center,
              //myCountry= 'Random';
              children: <Widget>[
                ProverbDisplay(myId, myCountry),
              ],

              //),
            ),
          ]),
        ),
      ),
    );
  }
}
 */

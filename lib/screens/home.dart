import 'package:flutter/material.dart';
import 'package:projet1_proverbe_v2/utils/mixins/CountryModelClass.dart';
import '../widgets/pageViewItem.dart';
import '../widgets/proverbDisplay.dart';
import '../widgets/MenuCanvas.dart';
import '../widgets/pageViewItem.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/HelperFunction.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create fields to store the current `myId` and current `myMenu`, si je ne met pas "0" et "Random" j'ai une erreur "null".
  int myId = 3;
  String myCountry; //Not used here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // body: Expanded(
          child: Column(children: <Widget>[
            //ROW 1 //Affichage Menu
            //SizedBox(height: 100),
            Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CurvePainterContainer(),
                PageViewItem(onChanged: (newMyId, newMyCountry) {
                  setState(() {
                    myId = newMyId;
                    myCountry = newMyCountry;
                    print("myId from home : $myId");
                    print(myCountry);
                  });
                }),
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

/*
import 'package:flutter/material.dart';
import 'package:projet1_proverbe_v2/utils/mixins/CountryModelClass.dart';
import '../widgets/pageViewItem.dart';
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

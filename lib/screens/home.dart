import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/pageViewItem.dart';
import '../widgets/proverbDisplay.dart';


// https://flutter.dev/docs/development/ui/layout

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:

        Container(
          child: Column(children: <Widget>[
            //ROW 1
            SizedBox(height: 100),
            Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //CurvePainterContainer(),
                PageViewItem(),
                // _buildCheckIcon(),
              ],
            ),
            // SizedBox(height: 150),
            // ROW 2
            SizedBox(height: 100),
            Row(
              //AFFICHAGE des proverbes
              // Expanded(
              // permet a son contenu de prendre toute la place horyzontal disponible , puisque on a autiliser un " width: double.infinity, "
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                proverbDisplay(),
                //DisplayProverb(_myService),
                // _showProverbeOnTap(),
                // _buildCheckIcon(),
              ],
              //),
            ),
          ]),
        ),
        /*
           Container(
          child:
          Column(
              children: <Widget>[
            SizedBox(height: 100),
            //ROW 1 ///////////////////////////////////////////////////////////
            Expanded(
              child: Stack(
                children: <Widget>[
                  //CurvePainterContainer(),
                  PageViewItem(),
                ],
              ),
            ),
            // ROW 2 ///////////////////////////////////////////////////////////


          //  Row(
          //    mainAxisSize: MainAxisSize.min,
          //    children: <Widget>[
               proverbDisplay(),
           //  ],
              //),
          //  ),
          ]
          ),
        ),
         */
      ),
    );
  }
}

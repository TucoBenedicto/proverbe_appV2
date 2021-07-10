import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/pageViewItem.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(children: <Widget>[
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
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //DisplayProverb(),
              ],
              //),
            ),
          ]),
        ),
      ),
    );
  }
}

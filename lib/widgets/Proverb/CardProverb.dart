import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Menu/Menu.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';
import 'proverbDisplay.dart';
import 'dart:math'; //(Random)

class cardProverb extends StatelessWidget {
  final String text;
  final double size;
  //final FontWeight fontWeight;
  final Color color;
  //final double wordSpacing;
  //final VoidCallback onClick;
  final int index;

  const cardProverb({
    @required this.index,
    @required this.text,
    this.size,
    //this.fontWeight,
    this.color,
    //this.wordSpacing,
    //this.onClick,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: index % 2 == 0
                ? Colors.lightBlue.withOpacity(0.4)
                : Colors.white.withOpacity(0.4),
            elevation: 2,
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  leading: Container(
                    //padding: EdgeInsets.only( bottom: 50),
                    child: Icon(Icons.format_quote, size: 40),
                  ),
                  subtitle: Center(
                    //widthFactor: 0.5,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Text(text, style: TextStyle(fontSize: 18.0)),
                    ),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: Icon(Icons.format_quote, size: 40),
                  )),
            ]),
          ),
        ),
        /*
         SizedBox(height: 30),
        Center(
          child: Icon(Icons.swipe,size : 50),
        ),
         */
      ],
    );
  }
}

/*
Container cardProverb() {
  final Widget childWidget;
  cardProverb({this.childWidget});
  return Container(
    color: Colors.blue,
    height: 250,
    width: 300,
  );
}
 */
/*
var flex = Container(
  width: 50,
  height: 50,
  color: Colors.red,
);
 */
/*
Random random = Random();
Map <String,dynamic>proverbCountrySelected =
{} ; //Attention visiblement une erreur ici , mettre des donnés pour que l'ppli demarre dessus

var flex = Container(

//child: cardProverb(), //<----------------
  color: Colors.blue,
  height: 250,
  child: Row(
    children: [
//cardProverb(), //<----------------
      Container(
        width: 300,
        child: PageView.builder(itemBuilder: (context, index) {
          //int randomProverbIndex = random.nextInt(proverbCountrySelected.length);
          int randomProverbIndex = random.nextInt(proverbCountrySelected.length);
          String randomProverbStringIndex = randomProverbIndex.toString();
          return Text("${proverbCountrySelected[randomProverbStringIndex]}");
        }),
      ),
    ],
  ),
);
 */

/*
var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.green[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);
final ratings = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      stars,
      Text(
        '170 Reviews',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    ],
  ),
);
 */

/*
  Widget build(BuildContext context) {
    return Container(
      child : _showProverbeOnTap(),
    );
    /*
     return MaterialApp(
      home: Scaffold(
        body: Container(

          /*
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2021/05/08/03/30/waterfall-6237479_960_720.jpg"),
              fit: BoxFit.cover,
            ),
          ),*/

          child: Column(children: <Widget>[
            //ROW 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // CurvePainterContainer(),
                gradientCountryContent(),
                // _buildCheckIcon(),
              ],
            ),
            // SizedBox(height: 150),
            // ROW 2
            Row(
              //AFFICHAGE des proverbes
              // Expanded(
              // permet a son contenu de prendre toute la place horyzontal disponible , puisque on a autiliser un " width: double.infinity, "
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _showProverbeOnTap(),
                // _buildCheckIcon(),
              ],
              //),
            ),
          ]),
        ),
      ),
    );
     */
  }
 */

import 'package:flutter/material.dart';
import './pageViewItem.dart';
import '../utils/mixins/CountryDataList.dart';
import '../utils/mixins/CountryModelClass.dart';
import './proverbDisplay.dart';
import 'dart:math'; //(Random)

/*
 Container cardProverb(){
  return Container(
    //Test
    /*
    width: 50,
    height: 50,
    color: Colors.red,
 */

    color: Colors.blue,
    height: 250,
    child: Row(
      children: [
        //cardProverb(), //<----------------
        Container(
          width: 300,
          child: PageView.builder(itemBuilder: (context, index) {
            int randomProverbIndex =
            random.nextInt(proverbCountrySelected.length);
            String randomProverbStringIndex = randomProverbIndex.toString();
            return Text(
                "${proverbCountrySelected[randomProverbStringIndex]}");
          }),
        ),
      ],
    ),




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

import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './Card.dart';
import '../utils/mixins/HelperFunction.dart';
import '../utils/mixins/CountryModelClass.dart'; // Class InterestsModel

class ProverbDisplay extends StatefulWidget {
  final int myId;
  final String myCountry; // Not used here
  const ProverbDisplay(this.myId, this.myCountry);

  @override
  _ProverbDisplayState createState() => _ProverbDisplayState();
}

class _ProverbDisplayState extends State<ProverbDisplay> {
  // Initisiation
  Random random = Random.secure();
  List<String> test = [];
  //Scrolling - PROVERB
  Container proverbContainer([int index]) {
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      height: 200,
      width: 350,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        //controller: controller,
        // itemCount: 1,
        physics: BouncingScrollPhysics(),
        //itemBuilder: (BuildContext context, int index) {
        itemBuilder: (BuildContext context, index) {
          return Container(
            child: proverb(widget.myId),
            // proverb(2), //Le parametre ici permet de changer de pays
          );
        },
      ),
    );
  }

  Widget proverb(int index) {
    return FutureBuilder(
        future: loadItemMenu(index), //ICI changement pays
        builder: (context, snapshot) {
         // test = snapshot.data.idProverb; //get the content from the snapshot
        //  print('$test');
          if (!snapshot.hasData) {
            return Text('Loading...');
          } else {
            return Container(
              color: Colors.blue,
              height: 250,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    //!! Attention ici ajout de "PageView.builder" qui peux faire doublon avec un 1er ajouter plus haut cependant , si je l'enleve je vais avoir l'erreur "sentence = null"
                    child: PageView.builder(itemBuilder: (context, index) {
                      //RANDOM
                      int proverbLength = snapshot.data.idProverb.length; //Nombre total de proverbe par pays.
                      int randomProverbIndex = random.nextInt(proverbLength);
                      print('proverbLength : $proverbLength');
                      return Text(
                          "Proverb : ${snapshot.data.idProverb[randomProverbIndex]}", // l'index ici permet de selection un proverbe
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'RadicalThin',
                            fontSize: 13.0,
                          ));
                    }),
                  ),
                ],
              ),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      debugPrint('proverbDispaly myId : ${widget.myId}');
    });

    // print(test);
    return Container(
      child: proverbContainer(),
    );
  }
}

// Save 0 (vielle save de proverbV1
/*

 */

// Save 1 (Brouillon) //Fonctionne //mais erreur lors du run de l'application
/*
import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './Card.dart';

class ProverbDisplay extends StatefulWidget {
  final int myId;
  final String myCountry;
  const ProverbDisplay(this.myId, this.myCountry);
  @override
  _ProverbDisplayState createState() => _ProverbDisplayState();
}

class _ProverbDisplayState extends State<ProverbDisplay> {
  Map<String, dynamic> proverbCountrySelected =
      {}; //Attention visiblement une erreur ici , mettre des donnés pour que l'ppli demarre dessus
  String selected;
  Map<String, dynamic> dataJsonObject;
  Random random = Random();

  Future getJsonProverb() async {
    //Get JSON
    final String rawJson =
        await rootBundle.loadString('assets/json/proverb.json');
    dataJsonObject = await jsonDecode(rawJson);
    return dataJsonObject;
  }

  @override
  void initState() {
    super.initState();
    getJsonProverb();
  }

  @override
  Widget build(BuildContext context) {
    proverbCountrySelected = dataJsonObject[widget.myCountry];
    selected = proverbCountrySelected.values.toList()[widget.myId];
    //debugPrint('ID proverbCountrySelected: ${widget.myId}');
    //debugPrint('Country proverbCountrySelected: ${widget.myCountry}');

    return Container(
      //child: cardProverb(), //<----------------
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
}
 */

// Save 2 / Fonctionne bien mais code pas propre

/*
import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './Card.dart';
import '../utils/mixins/HelperFunction.dart';
import '../utils/mixins/CountryModelClass.dart'; // Class InterestsModel

class ProverbDisplay extends StatefulWidget {
  final int myId;
  final String myCountry;
  const ProverbDisplay(this.myId, this.myCountry);

  @override
  _ProverbDisplayState createState() => _ProverbDisplayState();
}

class _ProverbDisplayState extends State<ProverbDisplay> {

//Future getJsonProverb(InterestsModel data) async {
  Future getJsonProverb(String country) async {
    Map<String, dynamic> proverbCountrySelected = {};
    final String rawJson = await rootBundle.loadString('assets/json/proverb.json');
    var datasJsonObject = await jsonDecode(rawJson);
    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];
    proverbCountrySelected = datasJsonObject[country];
    return proverbCountrySelected; //Renvoi le proverbe
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getJsonProverb(widget.myCountry),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading...');
          } else {
            return Container(
              color: Colors.blue,
              height: 250,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    child: PageView.builder(itemBuilder: (context, index) {
                      debugPrint('snapshot.data: ${snapshot.data}');
                      debugPrint('snapshot.data: ${snapshot.data.length}');

                      Random random = Random.secure();
                      int randomProverbIndex = random.nextInt(snapshot.data.length);
                      String randomProverbStringIndex = randomProverbIndex.toString();

                      return Text("${snapshot.data[randomProverbStringIndex]}");
                    }),
                  ),
                ],
              ),
            );
          }
        });
  }
}
 */

//Save 3 (function outisde class)

// Save 4 (rename paremeter with class "interest country"

import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './Card.dart';
import '../utils/mixins/CountryDataList.dart';
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

// Save 0 (vielle save de proverbV1
/*

  Map<String, dynamic> proverbCountrySelected =
  {}; //Attention visiblement une erreur ici , mettre des donnés pour que l'ppli demarre dessus
  String selected;
  Map<String, dynamic> dataJsonObject;
  Random random = Random();

  FutureBuilder readJsonProverb() {
    return FutureBuilder<dynamic>(
        future: getJsonProverb(),
    // on affiche le proberve mais de manier asynchrone (temps de chargement).
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    switch (snapshot.connectionState) {
    case ConnectionState.waiting: //Chargement
    //return Text('Loading....'); //Message de chargement
    return Center(
    child:
    CircularProgressIndicator(), //Fonction qui ajoute une icone de chargement.
    );
    default:
    if (snapshot.hasError) {
    //Message d'erreur si sa ne marche pas.
    return Text('Error: ${snapshot.error}');
    } else {

    return Container(

    width: MediaQuery.of(context).size.width,

    height: 200,
    child: PageView.builder(
    itemBuilder: (context, index) {

    int randomProverbIndex = random.nextInt(proverbCountrySelected.length);

    String randomProverbStringIndex = randomProverbIndex.toString();

    return Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    ),
    color: index % 2 == 0
    ? Colors.lightBlueAccent.withOpacity(0.4)
        : Colors.white.withOpacity(0.4),
    elevation: 5,
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    ListTile(
    leading: Container(
    //padding: EdgeInsets.only( bottom: 50),
    child: Icon(Icons.format_quote, size: 40),
    ),

    subtitle: Center(
    //widthFactor: 0.5,
    child: Padding(
    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
    child: Text(
    "${proverbCountrySelected[randomProverbStringIndex]}",
    style: TextStyle(fontSize: 18.0)),
    ),
    ),
    trailing: Container(
    padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
    child: Icon(Icons.format_quote, size: 40),
    )),
    ]));



                  },
                ),
              );
            }
        }
      },
    );
  }
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
import '../utils/mixins/CountryDataList.dart';
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

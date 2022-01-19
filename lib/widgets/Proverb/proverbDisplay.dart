import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import 'CardProverb.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart'; // Class InterestsModel

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
  int flex;

  //Scrolling - PROVERB
  Container proverbContainer() {
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 1);
    return Container(

      //color: Colors.redAccent,
      width: 380,
      //height: double.infinity,
      //height: MediaQuery.,
      height: 450,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        // itemCount: 1,
        physics: BouncingScrollPhysics(),
        //itemBuilder: (BuildContext context, int index) {
        itemBuilder: (BuildContext context, index) {
          flex = index;
          //print('itemBuilder :: $index');

          return Container(
            child: proverb(
                widget.myId), //Le parametre ici permet de changer de pays
          );
        },
      ),
    );
  }

  Widget proverb(int index) {
    return FutureBuilder(
        future: loadItemMenu(index), //ICI changement pays
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // return Text('Loading...');
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            //RANDOM index
            int proverbLength = snapshot
                .data.idProverb.length; //Nombre total de proverbe par pays.
            int randomProverbIndex = random.nextInt(proverbLength);
            return cardProverb(
                text: "${snapshot.data.idProverb[randomProverbIndex]}",
                color: Colors.grey,
                size: 13.0,
                index: flex);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      // debugPrint('proverbDispaly myId : ${widget.myId}');
    });

    return Container(
      //  padding:  EdgeInsets.all(5.0),
      padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
      child :proverbContainer(),
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
import './CardProverb.dart';

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
import './CardProverb.dart';
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

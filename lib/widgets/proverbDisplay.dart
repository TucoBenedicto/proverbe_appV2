import 'package:flutter/material.dart';
import '../utils/mixins/CountryDataList.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../widgets/pageViewItem.dart'; // <---
import './pageViewItem.dart'; // <---

import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //Random
import 'package:flutter/foundation.dart'; //debugPrint()

//PARENT
// https://medium.com/flutter-community/data-binding-in-flutter-or-passing-data-from-a-child-widget-to-a-parent-widget-4b1c5ffe2114

class proverbDisplay extends StatefulWidget {
  final int myId ;
  final String myMenu ;
  const proverbDisplay(this.myId, this.myMenu);
  @override
  _proverbDisplayState createState() => _proverbDisplayState();
}

class _proverbDisplayState extends State<proverbDisplay> {
  //Map<String, dynamic> proverbeCountrySelected = {"Random": "0"};
  Map<String, dynamic> proverbeCountrySelected = {};

  String selected;
  var datasJsonObject;
  Random random = new Random();//Variable random me permet de mettre un proverbe au hazard

  Future getJsonProverb() async {

    //Recuperation JSON
    final String rawJson = await rootBundle.loadString('assets/json/proverb.json');
    datasJsonObject = await jsonDecode(rawJson);
    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];
    //POO recuperer le pays
    /*
        print('DATA proverbeSelect keys: ${proverbeCountrySelected.keys.toList()[3]}'); //
    /*
      keys.toList()[3]} : va renvoyer la 3er cle du fichier JSON , ici : American
     */
    print('DATA proverbeSelect values: ${proverbeCountrySelected.values.toList()[3]}');
    /*
     values.toList()[3]} : renvoi toute les valeur de la clef "american"   : {0: American 1 AmericanAmericanAmericanAmerican AmericanAmericanAmericanAmericanAmerican, 1: American 2 AmericanAmericanAmericanAmerican AmericanAmericanAmericanAmericanAmerican, 2: America
     */
    print('DATA proverbeSelect entries: ${proverbeCountrySelected.entries.toList()[3]}');
     */
    //proverbeCountrySelected = datasJsonObject[widget.myMenu];
    //selectionproverbe = proverbeCountrySelected.values.toList()[1];
    //proverbeCountrySelected = datasJsonObject["Japonais"];
    //proverbeCountrySelected = datasJsonObject.keys.toList()[3].values.toList()[1];
    //proverbeCountrySelected = datasJsonObject;
    //Text('${itemData[index].Counter}'
    //DEBugage
    //debugPrint('DATA proverbeSelect outside: ${proverbeCountrySelected['1']}');
    debugPrint('DATA proverbeSelect !!!!: ${proverbeCountrySelected}');
    return datasJsonObject; //Renvoi le proverbe du pays selctionner
  }

    @override
  void initState() {
    super.initState();
    getJsonProverb();
  }

  //Save POO
/*
    int selectedCountry = 1 ; //Attention c'est ici que se fait le choix du pays , binding a faire ici

  Map<String, dynamic> proverbeCountrySelected = {};

  Future getJsonProverb(InterestsModel data) async {
    //Recuperation JSON
    final String rawJson = await rootBundle.loadString('assets/json/proverb.json');
    var datasJsonObject = await jsonDecode(rawJson);

    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];

    //POO recuperer le pays
    proverbeCountrySelected = datasJsonObject[data.country];

    //Text('${itemData[index].Counter}'

    //DEBugage
    debugPrint('DATA proverbeSelect: $proverbeCountrySelected');
    debugPrint('DATA:::::::::::::::: $data');
    print('DATA proverbeSelect outside: ${proverbeCountrySelected['1']}');
    return proverbeCountrySelected; //Renvoi le proverbe
  }

  @override
  void initState() {
    super.initState();
    getJsonProverb(countrydata[selectedCountry]);
  }

 */

  @override
  Widget build(BuildContext context) {
    debugPrint('DATA proverbeSelect: ${widget.myId}'); // OK
    debugPrint('DATA proverbeSelect: ${widget.myMenu}'); // OK
    proverbeCountrySelected = datasJsonObject[widget.myMenu] ;
    selected = proverbeCountrySelected.values.toList()[widget.myId];
    return Container(
      color: Colors.blue,
      height: 250,
      //width: 370,
      // child: Text('${selectionproverbe}'),
      child: Row(
        children: [
          //Text('My ID is : ${widget.myId}'),
          //Text('My menu is : ${widget.myMenu}'),
          Container(
            width: 300,
            //child: Text('${selected}'),
            child: PageView.builder(itemBuilder: (context, index) {
              //Random proverbe
              int randomProverbIndex = random.nextInt(proverbeCountrySelected.length);
              //String convertion beacause "unProverbe" is a "map" type
              String randomProverbStringIndex = randomProverbIndex.toString();
              return Text("${proverbeCountrySelected[randomProverbStringIndex]}");
            }),
          ),
        ],
      ),
    );
  }
}

//Last Save
/*
import 'package:flutter/material.dart';

import '../utils/mixins/CountryDataList.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../widgets/pageViewItem.dart'; // <---
import './pageViewItem.dart'; // <---

import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //Random
import 'package:flutter/foundation.dart'; //debugPrint()

//PARENT
// https://medium.com/flutter-community/data-binding-in-flutter-or-passing-data-from-a-child-widget-to-a-parent-widget-4b1c5ffe2114

class proverbDisplay extends StatefulWidget {
  @override
  _proverbDisplayState createState() => _proverbDisplayState();
}

class _proverbDisplayState extends State<proverbDisplay> {
  PageViewItem flexi = PageViewItem();
  MyService _myService = MyService();
  int selectedCountry = 1 ; //Attention c'est ici que se fait le choix du pays , binding a faire ici

  Map<String, dynamic> proverbeCountrySelected = {};

  Future getJsonProverb() async {
    //Recuperation JSON
    final String rawJson =
        await rootBundle.loadString('assets/json/proverb.json');
    var datasJsonObject = await jsonDecode(rawJson);

    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];

    //POO recuperer le pays
    proverbeCountrySelected = datasJsonObject["Japonais"];
    //proverbeCountrySelected = datasJsonObject;
    //Text('${itemData[index].Counter}'

    //DEBugage
    debugPrint('DATA proverbeSelect: $proverbeCountrySelected');
    //debugPrint('DATA:::::::::::::::: $flex');
    //debugPrint('DATA proverbeSelect outside: ${proverbeCountrySelected['1']}');

    setState(() {
       flexi.flex;
      //print('$_myService');
      //print('DATA PageViewItem: ${ flexi._myService }');
      //print('${_myService.}');
      //print('DATA PageViewItem: ${ flexi.gestureDetector_Ontap(1)}');
      print('DATA PageViewItem: ${flexi.flex}');
    });

    return proverbeCountrySelected; //Renvoi le proverbe
  }

  @override
  void initState() {
    super.initState();
    getJsonProverb();
    // getJsonProverb(countrydata[selectedCountry]);
  }

  //Save POO
/*
    int selectedCountry = 1 ; //Attention c'est ici que se fait le choix du pays , binding a faire ici

  Map<String, dynamic> proverbeCountrySelected = {};

  Future getJsonProverb(InterestsModel data) async {
    //Recuperation JSON
    final String rawJson = await rootBundle.loadString('assets/json/proverb.json');
    var datasJsonObject = await jsonDecode(rawJson);

    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];

    //POO recuperer le pays
    proverbeCountrySelected = datasJsonObject[data.country];

    //Text('${itemData[index].Counter}'

    //DEBugage
    debugPrint('DATA proverbeSelect: $proverbeCountrySelected');
    debugPrint('DATA:::::::::::::::: $data');
    print('DATA proverbeSelect outside: ${proverbeCountrySelected['1']}');
    return proverbeCountrySelected; //Renvoi le proverbe
  }

  @override
  void initState() {
    super.initState();
    getJsonProverb(countrydata[selectedCountry]);
  }

 */

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 250,
      width: 250,
      //child: Text('${proverbeCountrySelected}'),
      child: Text('${flexi.flex}'),

    );
  }
}
 */

//Save 2 corrige pour cette exemple .
/*
class proverbDisplay extends StatelessWidget {
  int selectedCountry;

  Map<String, dynamic> proverbeCountrySelected = {};

  //Variable random me permet de mettre un proverbe au hazard
  Random random = new Random();

  //Fonction renvoi oui ou non la fonction readJsonProverb
  Container showProverbeOnTap() {
    if (selectedCountry == null) {
      //Si ma selection est vide alors "null"
      return Container(); //Alors on creer un container vide
    } else {
      print('on the new class : $selectedCountry');
      return Container(
        child: readJsonProverb(),
      );
    }
  }

  // PROVERBE BUILDER ////////////////////////////////////////////////////////////////////
  // Recuperation du fichier JSON en asynchrone
  Future getJsonProverb(InterestsModel data) async {
    final String rawJson =
        await rootBundle.loadString('assets/Json/proverb.json');
    var datasJsonObject = await jsonDecode(rawJson);
    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];
    proverbeCountrySelected = datasJsonObject[data.title];
    //Text('${itemData[index].Counter}'
    debugPrint('DATA proverbeSelect: $proverbeCountrySelected');
    return proverbeCountrySelected; //Renvoi le proverbe
  }

// Affichage du JSON de maniere asynchrone + barre de chargement
  FutureBuilder readJsonProverb() {
    return FutureBuilder<dynamic>(
      future: getJsonProverb(countrydata[selectedCountry]),
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
              //Sinon on peut enfin afficher le contenu
              return Container(
                //Display view
                //width: double.infinity, //I want to be as big as my parent allows double.infinity
                width: MediaQuery.of(context).size.width,
                //width: 300,
                //width: 500,
                height: 200,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    //Random proverbe
                    int randomProverbIndex =
                        random.nextInt(proverbeCountrySelected.length);
                    //String convertion beacause "unProverbe" is a "map" type
                    String randomProverbStringIndex =
                        randomProverbIndex.toString();

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
                                        "${proverbeCountrySelected[randomProverbStringIndex]}",
                                        style: TextStyle(fontSize: 18.0)),
                                  ),
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                                  child: Icon(Icons.format_quote, size: 40),
                                )),
                          ]),
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 25,
      width: 25,
    );
  }
}
 */

//Save  //Code uniquement avec la partie displayproverbe
/*
// adb connect localhost:5555
import 'package:flutter/material.dart';

//JSON
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart';

//Widget
import '../view/home.dart';
import '../widget/bottomNavigationBar.dart';
import '../widget/countryPageView.dart';
import '../widget/topCanvas.dart';
import 'countryPageView.dart';

//Random
import 'dart:math';

//Debug
import 'package:flutter/foundation.dart';

class DisplayProverb extends StatefulWidget {

  @override
  _DisplayProverbState createState() => _DisplayProverbState();

}

class _DisplayProverbState extends State<DisplayProverb> {
  //final int crt;
  //FIELD //////////////////////////////////////////////////////////

   List interests = [
    InterestsModel('Japonais', 'assets/logo/bonsai1.jpg'),
    InterestsModel('Senegalais', 'assets/logo/bonsai2.jpg'),
    InterestsModel('Random', 'assets/logo/bonsai3.jpg'),
    InterestsModel('American', 'assets/logo/bonsai4.jpg'),
    InterestsModel('Marocan', 'assets/logo/bonsai5.jpg')
  ];

  int selectedCountry ;
  Map <String, dynamic> proverbeCountrySelected = {};

  //Variable random me permet de mettre un proverbe au hazard
  Random random = new Random();

  //////////////////////////////////////////////////////////
// (appel de la class externe) instentiation de la class externe
// pour recuperer les variables "currentIdx" ou "crt" .
 // final CountryPageView ani = new CountryPageView();
 //  var selectedCountry = CountryPageView(pageController.crt);
  //print(ani.countryPageView());

  //Fonction renvoi oui ou non la fonction readJsonProverb
  Container _showProverbeOnTap() {
//this.crt = selectedCountry;
  //selectedCountry = crt ;
    if (selectedCountry == null) {
      //Si ma selection est vide alors "null"
      return Container(); //Alors on creer un container vide
    } else {
      print('on the new class : $selectedCountry');
      return Container(
        child: readJsonProverb(),
      );
    }
  }

  // PROVERBE BUILDER ////////////////////////////////////////////////////////////////////
  // Recuperation du fichier JSON en asynchrone
  Future getJsonProverb(InterestsModel data) async {
    final String rawJson = await rootBundle.loadString('assets/Json/test.json');
    var datasJsonObject = await jsonDecode(rawJson);
    //data = jsonEncode(datasJsonObject["japonais"]["$page"]).replaceAll('"', '');
    //data = datasJsonObject["Japonais"];
    proverbeCountrySelected = datasJsonObject[data.title];
    //Text('${itemData[index].Counter}'
    debugPrint('DATA proverbeSelect: $proverbeCountrySelected');
    return proverbeCountrySelected; //Renvoi le proverbe
  }

// Affichage du JSON de maniere asynchrone + barre de chargement
  FutureBuilder readJsonProverb() {
    return FutureBuilder<dynamic>(
      future: getJsonProverb(interests[selectedCountry]),
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
              //Sinon on peut enfin afficher le contenu
              return Container(
                //Display view
                //width: double.infinity, //I want to be as big as my parent allows double.infinity
                width: MediaQuery.of(context).size.width,
                //width: 300,
                //width: 500,
                height: 200,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    //Random proverbe
                    int randomProverbIndex =
                    random.nextInt(proverbeCountrySelected.length);
                    //String convertion beacause "unProverbe" is a "map" type
                    String randomProverbStringIndex =
                    randomProverbIndex.toString();

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
                                /*
                                title: Text(
                                    'Sonu Nigam',
                                    style: TextStyle(fontSize: 30.0)
                                ),*/
                                subtitle: Center(
                                  //widthFactor: 0.5,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                    child: Text(
                                        "${proverbeCountrySelected[randomProverbStringIndex]}",
                                        style: TextStyle(fontSize: 18.0)),
                                  ),
                                ),
                                trailing: Container(
                                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                                  child: Icon(Icons.format_quote, size: 40),
                                )),
                          ]),

                      /*
                        child: Center(
                          child: Text(
                              "${proverbeCountrySelected[randomProverbStringIndex]}",
                              style: TextStyle(fontSize: 20.0)

                        ),
                          /*
                        Text('${itemData[index].Counter}',style: TextStyle(color: Colors.white70),),
                        */ /*
                        Text("Page: "+( _curr+1).toString()+"/"+_list.length.toString(),textScaleFactor: 2,),)
                        */
                        ),*/
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }



  @override
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
}


class InterestsModel {
  //Field
  String imageAsset;
  String title;
  //Constructeur
  InterestsModel(this.title, this.imageAsset);
}


 */

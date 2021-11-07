import 'package:flutter/material.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';
import '../Background/MenuCanvas.dart';
import 'ButtonItem.dart';
import '../Proverb/proverbDisplay.dart';
import 'package:flutter/foundation.dart'; //(debugPrint)
import 'dart:math'; //(Random)

class PageViewItem extends StatefulWidget {
  final void Function(int myId, String myCountry,PageController pageController1) onChanged;
  const PageViewItem({this.onChanged});

  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {

//Initialisation
  Random random = Random.secure();
  //int myId = 0;
  int myId ;
  String myCountry;
  String countryName;
  PageController pageController1;
  // List selected = false;
  List<String> itemCountLenght = [];

  List<bool> selected = [
    false,
    false,
    false,
    false,
    false
  ]; // Trigger Button animation

  String assetsIcon;

//Scrolling - MENU
  Container menuContainer() {
    final PageController controller = PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        //itemCount: itemCountLenght,
        itemCount: selected.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: gestureDetectorOnTap(index),
          );
        },
      ),
    );
  }

  //OnTap - MENU
  //PLACER LE Widget CARD !!!!!
  GestureDetector gestureDetectorOnTap(int index, [ProverbList data]) {
    return GestureDetector(
      onTap: () {


        setState(() {
          //*****************************************************
          selected = [false, false, false, false, false];
          selected[index] = !selected[index];
          //*****************************************************
        });

        setState(() {
          myId = index;
          widget.onChanged(myId, myCountry, pageController1);
        });

      },
      child: Column(
        children: [
          SizedBox(height: 90),
          itemMenu(index),
        ],
      ),
    );
  }

  //Loading Item Menu - MENU
  Widget itemMenu([int index]) {
    return FutureBuilder(
      future: loadItemMenu(index),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        /*
         itemCountLenght.add( snapshot.data.country);
        print('itemCountLenght00 : ${itemCountLenght}');
         */
        if (snapshot.hasData) {
          //get country name
          countryName = snapshot.data.country;
          //print('itemCountLenght01 : ${countryName}'); //ne s'affiche que les elements present sur l'ecran

          //get assets (picks link)
          assetsIcon = snapshot.data.assetsIcon;
          //print('itemCountLenght : $assetsIcon'); //ne s'affiche que les elements present sur l'ecran

          return Column(
            children: [
              button(selected[index], assetsIcon),

              SizedBox(height: 10),
              //Text("Menu ${snapshot.data.country}",
              Text("Menu ${countryName}",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RadikalThin',
                    fontSize: 13.0,
                  )),
            ],
          );
        } else {
          //return Text("Loading");

          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  ////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      child: menuContainer(),
    );
  }
}

//SAve Corrigé - Menu Item + Proverb ProverbDisplay
/*
import 'package:flutter/material.dart';
import 'helperLoadJson.dart';
import 'student_model.dart';
import 'dart:math'; //(Random)

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//MENU//////////////////////////////////////////////////////////////////////////////////////
  Random random = Random.secure();
  int indexCountry = 0;
  var test;
//Scrolling - MENU
  Container menuContainer() {
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: 3,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: gestureDetectorOnTap(index),
          );
        },
      ),
    );
  }

  //OnTap - MENU
  GestureDetector gestureDetectorOnTap(int index, [SentenceList data]) {
    return GestureDetector(
      onTap: () {
        indexCountry = index;
        //String myName = data.sentences[index].name; //Error here
        /////////////////////////////////////////////////////////
        setState(() {
          debugPrint('indexCountry : ${indexCountry}'); // OK
          //debugPrint('myName : ${myName}'); // Error here
        });
        /////////////////////////////////////////////////////////
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          itemMenu(index),
        ],
      ),
    );
  }

  //Loading Item Menu - MENU
  Widget itemMenu([int index]) {
    return FutureBuilder(
      future: loadStudent(index),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return Text("Menu ${snapshot.data.name}",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'RadikalThin',
                fontSize: 13.0,
              ));
        else
          return Text("Loading");
      },
    );
  }
  ////////////////////////////////////////////////////////////////////////////////////////////

  //PROVERB//////////////////////////////////////////////////////////////////////////////////////
  //Scrolling - PROVERB
  Container proverbContainer() {
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        //controller: controller,
        //itemCount: 1,
        physics: BouncingScrollPhysics(),
        //itemBuilder: (BuildContext context, int index) {
        itemBuilder: (BuildContext context, index) {
          return Container(
            // child: proverb(index), //L'index ici permet de changer de pays
            child:
                proverb(indexCountry), //L'index ici permet de changer de pays
          );
        },
      ),
    );
  }

//Futur + pageviewbuilder
  Widget proverb(int index) {
    return FutureBuilder(
        //future: getJsonProverb(widget.myCountry),
        future: loadStudent(index),
        builder: (context, snapshot) {
          test = snapshot.data.sentence; //get the content from the snapshot
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
                      int proverbLength = snapshot.data.sentence.length; //Nombre total de proverbe par pays.
                      int randomProverbIndex = random.nextInt(proverbLength);
                      print('proverbLength : $proverbLength');
                      return Text(
                          "Proverb : ${snapshot.data.sentence[randomProverbIndex]}", // l'index ici permet de selection un proverbe
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
    print(test);
    return MaterialApp(
      home: Container(
        child: Column(
          children: [
            menuContainer(),
            proverbContainer(),
          ],
        ),
      ),
    );
  }
}

 */

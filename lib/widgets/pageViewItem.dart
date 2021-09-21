import 'package:flutter/material.dart';
import '../utils/mixins/HelperFunction.dart';
import '../utils/mixins/CountryModelClass.dart';
import './Button.dart';
import './proverbDisplay.dart';
import 'package:flutter/foundation.dart'; //(debugPrint)

import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './Card.dart';
import '../utils/mixins/HelperFunction.dart';
import '../utils/mixins/CountryModelClass.dart'; // Class InterestsModel


class PageViewItem extends StatefulWidget {
  final void Function(int myId, String myCountry) onChanged;
  const PageViewItem({this.onChanged});
// var chapter = Chapter(1, 'Once upon a time...');
  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
// Trigger Button animation
  List<bool> selected = [false, false, false, false, false];

 // PanierModel _panier = PanierModel();
  ProverbList proverbs = ProverbList();

/*
  Widget projectTest() {
    return FutureBuilder(
      future: getJsonProverb(widget.onChanged),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          //debugPrint("This is the output ${snapshot.data}"); // 0
          return Text("This is the output ${snapshot.data}");
        else
          //return Text("There is no output yet");
          debugPrint('pageViewItem dato 1 : ${snapshot.data[0]}'); // 0
          debugPrint('idProverb 0 : ${snapshot.data[0].idProverb[1]}');
          return Text("${snapshot.data[1]}");
      },
    );
  }
 */

  Widget projectWidget(int index) {
    return FutureBuilder(
      future: loadItemMenu(index),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return Text("Menu : ${snapshot.data.country}",
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'RadikalThin',
                fontSize: 13.0,
              ));
        else
          return Text("There is no output yet");
      },
    );
  }


  Container countryPageView() {
   // projectTest();
   // debugPrint('pageViewItem dato 1 : ${getJsonProverb()}'); // 0
    //getJsonProverb();
  //  debugPrint('pageViewItem dato 1 : ${getJsonProverb}'); // 0
    //getJsonProverb;


   //debugPrint('pageViewItem dato 1 : ${data.proverbs[1].country[1]}'); // 0
   //print('pageViewItem dato 1 : ${data.proverbs[1]}'); // 0
    final PageController controller = PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      height: 300,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        //itemCount: countryData.length,
        itemCount: 5, // a revoir : nombre de pays
        //itemCount: proverblist.proverbs.length, // a revoir : nombre de pays
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          //debugPrint('pageViewItem dato : ${data.proverbs[1].country}'); // 0
          return Container(
            child: gestureDetectorOntap(index),

          );
        },
      ),
    );
  }

 // GestureDetector gestureDetectorOntap(int index, [ProverbList datas]) {
  GestureDetector gestureDetectorOntap(int index, [ProverbList datas]) {
    //debugPrint('pageViewItem data : ${data.proverbs[1].country[1]}'); // 0
    //debugPrint('pageViewItem data  : ${widget.myCountry}'); // 0
    //debugPrint('idCountry : ${snapshot.data[0].idCountry}'); // 0

    //final Todo todo = widget.todo;
    //titleController.text = todo.title;
    //ProverbList proverbList;
    //ProverbList proverbs = ProverbList();
    return GestureDetector(
      onTap: () {
       // int myId = 3; //Binding id
        int myId = index; //Binding id
        //"${snapshot.data[1].idProverb[randomProverbIndex]}");
        //String myCountry = "proverx].country"; //Binding country

       // proverbList.proverbs;
        // data[1].idProverb[randomProverbIndex]
        String myCountry = datas.proverbs[1].country.toString(); //Binding country
        //var  myCountry = datas.proverbs[1].country ;
        //String myCountry = data.proverbs[1].country;
        //var  myCountry = "dzdzd" ;

        //debugPrint('snapshot.data[0].idCountry : ${datas.proverbs[1].country}'); // 0

        widget.onChanged(myId, myCountry); //Binding
        //*****************************************************
        setState(() {
          selected = [false, false, false, false, false];
          selected[index] = !selected[index];
        });
        //*****************************************************
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          //button(selected[index], imageAsset),
          // print('idCountry : ${proverbList.proverbs[0].idCountry}'); // 0
          projectWidget(index),
          /*
                  Text('${'data.proverbs[1].country'}',
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'RadikalThin',
                fontSize: 13.0,
              )),
           */
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     // child : countryPageView(),
      child: countryPageView(),
      /*
      width: 50,
      height: 50,
      color: Colors.red,
       */
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
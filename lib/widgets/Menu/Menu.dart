import 'package:flutter/material.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';
import '../Background/MenuCanvas.dart';
import 'ButtonItem.dart';
import '../Proverb/proverbDisplay.dart';
import 'package:flutter/foundation.dart'; //(debugPrint)
import 'dart:math'; //(Random)

class PageViewItem extends StatefulWidget {
  final void Function(
      int myId, String myCountry, PageController pageController1) onChanged;
  const PageViewItem({this.onChanged});

  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
//Initialisation
  Random random = Random.secure();
  //int myId = 0;
  int myId;
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
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Trigger Button animation

  String assetsIcon;

//Scrolling - MENU
  Container menuContainer() {
    // final PageController controller = PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.29);
    return Container(
      //height: 300,
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
          selected = [
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false
          ];
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
              //SizedBox(height: 10),
              //Text("Menu ${snapshot.data.country}",
              Stack(
                children: <Widget>[
                  Text(
                    //outline
                    " ${countryName}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, color: Colors.white, shadows: [
                      Shadow(
                        //color:Colors.greenAccent,
                        color: Colors.blueAccent,
                        blurRadius: 10,
                        offset: Offset(5, -5),
                      ),
                      Shadow(
                        color: Colors.red,
                        blurRadius: 10,
                        offset: Offset(-5, 5),
                      )
                    ]),
                  ),
                ],
              )
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

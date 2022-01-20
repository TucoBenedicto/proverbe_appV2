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

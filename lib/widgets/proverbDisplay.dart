import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)

class ProverbDisplay extends StatefulWidget {
  final int myId;
  final String myCountry;
  const ProverbDisplay(this.myId, this.myCountry);
  @override
  _ProverbDisplayState createState() => _ProverbDisplayState();
}

class _ProverbDisplayState extends State<ProverbDisplay> {
  Map<String, dynamic> proverbCountrySelected = {};
  String selected;
  Map <String, dynamic> dataJsonObject;
  Random random = new Random();

  Future getJsonProverb() async {
    //Get JSON
    final String rawJson = await rootBundle.loadString('assets/json/proverb.json');
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

    debugPrint('ID proverbCountrySelected: ${widget.myId}');
    debugPrint('Country proverbCountrySelected: ${widget.myCountry}');
    return Container(
      color: Colors.blue,
      height: 250,
      child: Row(
        children: [
          Container(
            width: 300,
            child: PageView.builder(itemBuilder: (context, index) {
              int randomProverbIndex = random.nextInt(proverbCountrySelected.length);
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

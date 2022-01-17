import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './CountryModelClass.dart'; // Class InterestsModel

/*
List countryData = <InterestsModel> [
  InterestsModel(0, 'Japonais', 'assets/images/button/bonsai1.jpg'),
  InterestsModel(1, 'Senegalais', 'assets/images/button/bonsai2.jpg'),
  InterestsModel(2, 'Random', 'assets/images/button/bonsai3.jpg'),
  InterestsModel(3, 'American', 'assets/images/button/bonsai4.jpg'),
  InterestsModel(4, 'Marocan', 'assets/images/button/bonsai5.jpg')
];
 */

//Load Json
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/json/proverb.json');
}

//Load Response
Future loadItemMenu([int index ,var data] /* ou String data*/) async { //[] permet de rendre les paramettre optionnelle.
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  ProverbList proverbList = ProverbList.fromJson(jsonResponse);

  return proverbList.proverbs[index];
}
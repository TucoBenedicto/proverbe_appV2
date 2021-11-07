import 'package:flutter/material.dart';
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart'; // (loadJson)
import 'dart:math'; //(Random)
import 'package:flutter/foundation.dart'; //(debugPrint)
import './CountryModelClass.dart'; // Class InterestsModel

/*
import 'CountryModelClass.dart';

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

/* DEBUG
  print('idCountry : ${proverbList.proverbs[0].idCountry}'); // 0
  print('country : ${proverbList.proverbs[0].country}'); // Japonais
  print('assets : ${proverbList.proverbs[0].assets}'); // 0
  print('idProverb : ${proverbList.proverbs[0].idProverb[1]}'); // Japonais
 */

  //return proverbList.proverbs[0].country;
  return proverbList.proverbs[index];
}

/*
Future loadProverb([var data] /* ou String data*/) async { //[] permet de rendre les paramettre optionnelle.
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  ProverbList proverbList = ProverbList.fromJson(jsonResponse);

  return proverbList.proverbs;
}

 */

//SAve corrigé juste
/*
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'student_model.dart';

//Load Json
Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/Copie.json');
}

//Load Response
Future loadStudent(int num) async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  SentenceList sentenceList = SentenceList.fromJson(jsonResponse);

   //Debug
  /*
    print('idCountry : ${sentenceList.sentences[0].idName}');
  print('country : ${sentenceList.sentences[0].name}');
  print('assets : ${sentenceList.sentences[0].assets}');
  print('idProverb : ${sentenceList.sentences[0].sentence[1]}');
   */

  return sentenceList.sentences[num]; //OK
}

 */
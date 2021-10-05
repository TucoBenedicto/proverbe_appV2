// adb connect localhost:5555
// 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


import 'package:flutter/material.dart';
import 'screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      // body : Container(),
    );
  }
}
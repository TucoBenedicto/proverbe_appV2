// adb connect localhost:5555
// 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

import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
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
        //home: MyHomePage(),
        // body : Container(),

        home: SplashScreen(
            seconds: 8,
            navigateAfterSeconds: MyHomePage(),
            // Add text under logo
            /*
             title: new Text(
              'SplashScreen Example',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.red),
            ),
             */
            image: new Image.asset(
                'assets/images/splashScreen/SplashScreenImage.png'),
            photoSize: 100.0,
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Colors.red));
  }
}

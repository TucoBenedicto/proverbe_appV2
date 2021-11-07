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
            seconds: 5,
            navigateAfterSeconds:MyHomePage(),
            title: new Text(
              'SplashScreen Example',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white),
            ),
            image: new Image.asset('assets/images/splashScreen/Logo_SplashScreen.png'),
            photoSize: 100.0,
            backgroundColor: Colors.blue,
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Colors.white
        )
    );
  }
}

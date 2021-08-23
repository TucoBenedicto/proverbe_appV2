import 'package:flutter/material.dart';
import './pageViewItem.dart';
import '../utils/mixins/CountryDataList.dart';
import '../utils/mixins/CountryModelClass.dart';

AnimatedContainer button(bool selected , String imageAsset) {
  //InterestsModel data;

    //String imageAsset='assets/images/button/bonsai1.jpg'; //Ok
    //String imageAsset2 = countryData[1].imageAsset; //OK
    //String imageAsset3 = data.imageAsset; //marche pas

    return AnimatedContainer(
      width: selected ? 200.0 : 100.0,
      height: selected ? 100.0 : 200.0,
      color: selected ? Colors.red : Colors.blue,
      alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      //child: Image.asset(imageAsset, fit: BoxFit.cover) //OK
      //child: Image.asset(imageAsset2, fit: BoxFit.cover) //OK
        child: Image.asset(imageAsset, fit: BoxFit.cover)
      );

/*
 AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Card(
        elevation: 18,
        clipBehavior: Clip.antiAlias,
        shape: CircleBorder(
            side: BorderSide(color: Colors.grey.shade200, width: 5)),
        child: Image.asset(
          data.imageAsset,
          fit: BoxFit.cover, //image inside the circle
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      )): AnimatedContainer(
  duration: Duration(seconds: 1),
  child: Card(
  elevation: 18,
  clipBehavior: Clip.antiAlias,
  shape: CircleBorder(
  side: BorderSide(color: Colors.grey.shade200, width: 5)),
  child: Image.asset(
  data.imageAsset,
  fit: BoxFit.cover,
  //image inside the circle
  ),
  ),
  decoration: BoxDecoration(
  color: Colors.grey.shade200,
  shape: BoxShape.circle,
  border: Border.all(
  color: Colors.white,
  width: 15,
  ),
  boxShadow: [
  new BoxShadow(
  color: Colors.red[100],
  offset: new Offset(0.0, 0.0),
  blurRadius: 20.0,
  spreadRadius: 5.0)
  ],
  ));

 */
}

/*
GestureDetector gestureDetectorOntap(int index) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        SizedBox(height: 40),
        Container(
          width: 70,
          height: 25,
          color: Colors.blue,
          alignment: AlignmentDirectional.center,
        ),
        Text('${countryData[index].country}',
            style: TextStyle(
              //color: Color.fromRGBO(243, 243, 243, 1),
              color: Colors.red,
              fontFamily: 'RadikalThin',
              fontSize: 13.0,
            )),
      ],
    ),
  );
}
 */

/*
GestureDetector gestureDetectorOntap(int index) {
  return GestureDetector(
    onTap: () {
      //int myId = countryData[index].id;
      myId = countryData[index].id;
      String myMenu = countryData[index].country;
      widget.onChanged(myId, myMenu);
      print('myIDpageViewItem $myId');
      print('myMenupageViewItem  $myMenu');

      setState(() {
        selected = !selected;
      });



    },
    child: Column(
      children: <Widget>[
        SizedBox(height: 30),
        button(selected),
        /*
          SizedBox(
              height: 129,
              width: 129,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: button(select),
                //child : name, //Class animated
              )),
 */
        Text('${countryData[index].country}',
            style: TextStyle(
              //color: Color.fromRGBO(243, 243, 243, 1),
              color: Colors.blue,
              fontFamily: 'RadikalThin',
              fontSize: 13.0,
            )),
      ],
    ),
    /*
            Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          '${countryData[index].country}',
        ),
      ),
       */
  );
}
 */

//Partie on tap
/*
//OnTape - Action quand j'appui sur une image
GestureDetector _buildPageViewItemCountry(InterestsModel data, int crt) {
  //selection :cadre jaune around the pics, non selectionner: cadre gris around the pics

  final backgroundAsset = selectedCountry != crt
      ? AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Card(
            elevation: 18,
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade200, width: 5)),
            child: Image.asset(
              data.imageAsset,
              fit: BoxFit.cover, //image inside the circle
            ),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ))
      : AnimatedContainer(
          duration: Duration(seconds: 1),
          child: Card(
            elevation: 18,
            clipBehavior: Clip.antiAlias,
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade200, width: 5)),
            child: Image.asset(
              data.imageAsset,
              fit: BoxFit.cover,
              //image inside the circle
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 15,
            ),
            boxShadow: [
              new BoxShadow(
                  color: Colors.red[100],
                  offset: new Offset(0.0, 0.0),
                  blurRadius: 20.0,
                  spreadRadius: 5.0)
            ],
          ));

  return GestureDetector(
    onTap: () {
      print("Container was tapped");
      setState(() {
        if (selectedCountry == crt) {
          //Si je clique a nouveau dessus , je suprime l'index (crt) et donc supprime l'affichage Si je ne met pas ce "null" , alors l'affichage reste definitevement
          selectedCountry = null;
        } else {
          //crt = index fournit dans le GestureDetector , j'aurais pus le nommer index
          selectedCountry = crt; //j'ajoute mon index (crt) à ma selection
          debugPrint('lastSelectedInterests: $selectedCountry');
          debugPrint('crt : $crt');
        }
      });
    },
    child: Column(
      children: <Widget>[
        Text(data.title.toUpperCase(),
            style: TextStyle(
              //color: Color.fromRGBO(243, 243, 243, 1),
              color: Colors.red,
              fontFamily: 'RadikalThin',
              fontSize: 11.0,
            )),
        SizedBox(
            height: 129,
            width: 129,
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: backgroundAsset,
            )),
      ],
    ),
  );
}

 */

// Old code
/*
// adb connect localhost:5555

// adb connect localhost:5555

/*
https://medium.com/flutter-community/flutter-design-patterns-1-singleton-437f04e923ce

https://dart.academy/creational-design-patterns-for-dart-and-flutter-singleton/

https://dev.to/lucianojung/global-variable-access-in-flutter-3ijm

https://zaiste.net/programming/dart/howtos/howto-create-singleton-dart/


 */

import 'package:flutter/material.dart';

//JSON
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart';

//Widget
import '../view/home.dart';
import '../widget/bottomNavigationBar.dart';
import '../widget/countryPageView.dart';
import '../widget/topCanvas.dart';
import '../widget/displayProverb.dart';
import '../widget/service.dart';

//Random
import 'dart:math';

//Debug
import 'package:flutter/foundation.dart';

class CountryPageView extends StatefulWidget {

  final MyService_Singleton myService; // Instentiaion/Declaration de l'objet "myService" a partir de la classe MyService_Singleton
  CountryPageView(this.myService); // making use of MyService instance (utilisation de l'instance "MyService")

  @override
  _CountryPageViewState createState() => _CountryPageViewState();
}

class _CountryPageViewState extends State<CountryPageView> {
//FIELD ////////////////////////////////////////////////////////////////////////
  final List interests = [
    InterestsModel('Japonais', 'assets/logo/bonsai1.jpg'),
    InterestsModel('Senegalais', 'assets/logo/bonsai2.jpg'),
    InterestsModel('Random', 'assets/logo/bonsai3.jpg'),
    InterestsModel('American', 'assets/logo/bonsai4.jpg'),
    InterestsModel('Marocan', 'assets/logo/bonsai5.jpg')
  ];
  //int selectedCountry;
  //MyService_Singleton _mySingletonClass = MyService_Singleton();

  PageController pageController =
      PageController(viewportFraction: 0.30, initialPage: 3);
////////////////////////////////////////////////////////////////////////////////

  //PageView.builder - Defilement des pays
  Container countryPageView() {
    return Container(
      //I want to be as big as my parent allows (double.infinity)
      //I want to be as big as the screen (MediaQuery).responsive across devices with different screen sizes
      //width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: PageView.builder(
        itemCount: interests.length,
        controller: pageController,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int currentIdx) {
          int crt = currentIdx;
          return Container(
            margin: const EdgeInsets.only(top: 90.0),
            child: _buildPageViewItemCountry(interests[crt], crt),
          );
        },
      ),
    );
  }

  //OnTape - Action quand j'appui sur une icone

    GestureDetector _buildPageViewItemCountry(InterestsModel data, int crt) {
    //selection :cadre jaune around the pics, non selectionner: cadre gris around the pics
    /*
    final String backgroundAsset = selectedCountry != crt
        ? 'assets/bg_yellow_bordered.png'
        : 'assets/bg_gray_bordered.png';*/
     int flex = widget.myService.myVariable;
    final backgroundAsset = flex != crt
        ? AnimatedContainer(
            //Animation etat initial
            duration: Duration(seconds: 1),
            child: Card(
              elevation: 18,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Image.asset(
                data.imageAsset,
                fit: BoxFit.cover, //image inside the circle
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ))
        : AnimatedContainer(
            //Animation etat final
            duration: Duration(seconds: 1),
            child: Card(
              elevation: 18,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Image.asset(
                data.imageAsset,
                fit: BoxFit.cover,
                //image inside the circle
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 15,
              ),
              boxShadow: [
                new BoxShadow(
                    color: Colors.red[100],
                    offset: new Offset(0.0, 0.0),
                    blurRadius: 20.0,
                    spreadRadius: 5.0)
              ],
            ));

    return GestureDetector(
      onTap: () {
        print("Container was tapped");
       // int flex = _mySingletonClass.myVariable;
        setState(() {
          if (flex == crt) {
            //Si je clique a nouveau dessus , je suprime l'index (crt) et donc supprime l'affichage Si je ne met pas ce "null" , alors l'affichage reste definitevement
            flex = null;
          } else {
            //crt = index fournit dans le GestureDetector , j'aurais pus le nommer index
            flex =crt; //j'ajoute mon index (crt) à ma selection

            debugPrint('widget.myVariable: ${flex}');
            debugPrint('crt : $crt');
          }
        });
      },

      child: Column(
        children: <Widget>[
          Text(data.title.toUpperCase(),
              style: TextStyle(
                //color: Color.fromRGBO(243, 243, 243, 1),
                color: Colors.red,
                fontFamily: 'RadikalThin',
                fontSize: 11.0,
              )),
          SizedBox(
              height: 129,
              width: 129,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                //decoration: backgroundAsset,
                // image: DecorationImage(image: AssetImage(backgroundAsset))
                //child: Image.asset(data.imageAsset),
                child: backgroundAsset,
              )),
          // DisplayProverbState(Count: crt), //get et transmission de la variable ""
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: countryPageView(),
    );
  }
}

class InterestsModel {
  //Field
  String imageAsset;
  String title;
  //Constructor
  InterestsModel(this.title, this.imageAsset);
}

//Save code
/*

import 'package:flutter/material.dart';

//JSON
import 'dart:convert'; //(jsonDecode)
import 'package:flutter/services.dart';

//Widget
import '../view/home.dart';
import '../widget/bottomNavigationBar.dart';
import '../widget/countryPageView.dart';
import '../widget/topCanvas.dart';

//Random
import 'dart:math';

//Debug
import 'package:flutter/foundation.dart';

class CountryPageView extends StatefulWidget {
  @override
  _CountryPageViewState createState() => _CountryPageViewState();

//final List<InterestsModel> todos;
//_CountryPageViewState({Key key, this.interests}) : super(key: key);
}

class _CountryPageViewState extends State<CountryPageView> {
//FIELD //////////////////////////////////////////////////////////

   final List interests = [
    InterestsModel('Japonais', 'assets/logo/bonsai1.jpg'),
    InterestsModel('Senegalais', 'assets/logo/bonsai2.jpg'),
    InterestsModel('Random', 'assets/logo/bonsai3.jpg'),
    InterestsModel('American', 'assets/logo/bonsai4.jpg'),
    InterestsModel('Marocan', 'assets/logo/bonsai5.jpg')
  ];
  int selectedCountry;
  //Map<String, dynamic> proverbeCountrySelected = {};
  //Variable random me permet de mettre un proverbe au hazard
  //Random random = new Random();

  //final List<InterestsModel> todos;
  //_CountryPageViewState({Key key, this.interests}) : super(key: key);

  //////////////////////////////////////////////////////////
  // Degradé (image) sur la selection
  Stack gradientCountryContent() {
    return Stack(
    //alignment: const Alignment(0.6, 0.6),
      children: <Widget>[
        CurvePainterContainer(), //!!!!!!!!!!!!!!
        //SizedBox(height: 150),
        countryPageView(),
        //_buildCheckIcon()
        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           // Image.asset('assets/bg_gradient_left.png'),
           // Image.asset('assets/bg_gradient_right.png'),
          ],
        ),
        */
      ],
    );
  }

  PageController pageController =
      PageController(viewportFraction: 0.30, initialPage: 3);

  //PageView.builder - Defilement des pays
  Container countryPageView() {
    return Container(
      //I want to be as big as my parent allows (double.infinity)
      //I want to be as big as the screen (MediaQuery).responsive across devices with different screen sizes
      //width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: PageView.builder(
        itemCount: interests.length,
        controller: pageController,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int currentIdx) {
          int crt = currentIdx;
          return Container(
            margin: const EdgeInsets.only(top: 90.0),
            child: _buildPageViewItemCountry(interests[crt], crt),
          );
        },
      ),
    );
  }

  //OnTape - Action quand j'appui sur une image
  GestureDetector _buildPageViewItemCountry(InterestsModel data, int crt) {
    //selection :cadre jaune around the pics, non selectionner: cadre gris around the pics
    /*
    final String backgroundAsset = selectedCountry != crt
        ? 'assets/bg_yellow_bordered.png'
        : 'assets/bg_gray_bordered.png';*/

    final backgroundAsset = selectedCountry != crt
        ? AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Card(
              elevation: 18,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Image.asset(
                data.imageAsset,
                fit: BoxFit.cover, //image inside the circle
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ))
        : AnimatedContainer(
            duration: Duration(seconds: 1),
            child: Card(
              elevation: 18,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Image.asset(
                data.imageAsset,
                fit: BoxFit.cover,
                //image inside the circle
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 15,
              ),
              boxShadow: [
                new BoxShadow(
                    color: Colors.red[100],
                    offset: new Offset(0.0, 0.0),
                    blurRadius: 20.0,
                    spreadRadius: 5.0)
              ],
            ));

    return GestureDetector(
      onTap: () {
        print("Container was tapped");
        setState(() {
          if (selectedCountry == crt) {
            //Si je clique a nouveau dessus , je suprime l'index (crt) et donc supprime l'affichage Si je ne met pas ce "null" , alors l'affichage reste definitevement
            selectedCountry = null;
          } else {
            //crt = index fournit dans le GestureDetector , j'aurais pus le nommer index
            selectedCountry = crt; //j'ajoute mon index (crt) à ma selection
            debugPrint('lastSelectedInterests: $selectedCountry');
            debugPrint('crt : $crt');
          }
        });
      },
      child: Column(
        children: <Widget>[
          Text(data.title.toUpperCase(),
              style: TextStyle(
                //color: Color.fromRGBO(243, 243, 243, 1),
                color: Colors.red,
                fontFamily: 'RadikalThin',
                fontSize: 11.0,
              )),
          SizedBox(
              height: 129,
              width: 129,
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                //decoration: backgroundAsset,
                // image: DecorationImage(image: AssetImage(backgroundAsset))
                //child: Image.asset(data.imageAsset),
                child: backgroundAsset,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
         child: gradientCountryContent(),
        );
  }
}
 */

/*
class InterestsModel {
  //Field
  String imageAsset;
  String title;
  //Constructor
  InterestsModel(this.title, this.imageAsset);
}
 */

/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          20,
              (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key,  this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            // When a user taps the ListTile, navigate to the DetailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current todo through to it.
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
                  settings: RouteSettings(
                    arguments: todos[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
 */

 */

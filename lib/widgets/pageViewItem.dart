// https://www.woolha.com/tutorials/flutter-creating-pageview-with-pagecontroller-examples
// adb connect localhost:5555
//SON
import 'package:flutter/material.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/CountryDataList.dart';
import '../widgets/proverbDisplay.dart';
import './proverbDisplay.dart';


class PageViewItem extends StatelessWidget {



  final void Function(int myId, String myMenu) onChanged;
  const PageViewItem({this.onChanged});



  Container CountryPageView() {


    //print("Name : ${countrydata[2].imageAsset}");

    final PageController controller = PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      color: Colors.red,
      height: 90,
      child: PageView.builder(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: countrydata.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          //flexu = 55;
          return Container(
            child: gestureDetector_Ontap(index),
          );
        },
      ),
    );
  }



  GestureDetector gestureDetector_Ontap(int index) {


    return GestureDetector(
      onTap: () {
        //flex = _myService.myVariable[index].id;
        //print('TiTle : ${countrydata[index].country}');
        /*
                print('TiTle: _myService.myVariable : ${myVariable[1]}');
        print('TiTle: _myService.myVariable ID : ${myVariable[index].id}');
        print('TiTle: _myService.myVariable country: ${myVariable[index].country}');
         */

        int myId = countrydata[index].id;
        String myMenu = countrydata[index].country;

        onChanged(myId, myMenu);

        print('myIDpageViewItem ${myId}');
        print('myMenupageViewItem  ${myMenu}');

      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          '${countrydata[index].country}', //Ok
          //'$flex',
        ),
      ),
    );
  }

  /* //OK
        final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      color: Colors.red,
      height: 90,
      child: PageView.builder(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: countrydata.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('${countrydata[index].title}');
            },
            child: Container(
              child: Text(
                '${countrydata[index].title}',
              ),
            ),
          );
        },
      ),
    );
     */
  Widget build(BuildContext context) {
    return Container(
      child: CountryPageView(),
    );
  }
}


// Last Save
/*
// https://www.woolha.com/tutorials/flutter-creating-pageview-with-pagecontroller-examples
// adb connect localhost:5555
//SON
import 'package:flutter/material.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/CountryDataList.dart';
import '../widgets/proverbDisplay.dart';
import './proverbDisplay.dart';


class PageViewItem extends StatelessWidget {
  //var MyVariableParametre = 3;
  MyService _myService = MyService();
  int flex = 0;
  //var flexu = 55; //OK binded
  //var  flexu;
  //var detail ;

  //PageViewItem({this.flex});

  Container CountryPageView() {

    //print("Name : ${countrydata[2].imageAsset}");

    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      color: Colors.red,
      height: 90,
      child: PageView.builder(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: countrydata.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          //flexu = 55;
          return Container(
            child: gestureDetector_Ontap(index),
          );
        },
      ),
    );
  }

  GestureDetector gestureDetector_Ontap(int index) {

    return GestureDetector(
      onTap: () {
        //flex = _myService.myVariable[index].id;
        //print('TiTle : ${countrydata[index].country}');
        print('TiTle: _myService.myVariable : ${_myService.myVariable[1]}');
        print('TiTle: _myService.myVariable : ${_myService.myVariable[index].id}');
        print('TiTle: _myService.myVariable : ${_myService.myVariable[index].country}');
        flex = countrydata[index].id;
        print('Id : ${countrydata[index].id}');
        //Appeler proverbe display
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          '${countrydata[index].country}', //Ok
          //'$flex',
        ),
      ),
    );
  }

  /* //OK
        final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      color: Colors.red,
      height: 90,
      child: PageView.builder(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: countrydata.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print('${countrydata[index].title}');
            },
            child: Container(
              child: Text(
                '${countrydata[index].title}',
              ),
            ),
          );
        },
      ),
    );
     */
  Widget build(BuildContext context) {
    return Container(
      child: CountryPageView(),
    );
  }
}
 */
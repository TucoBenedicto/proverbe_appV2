// https://www.woolha.com/tutorials/flutter-creating-pageview-with-pagecontroller-examples
// adb connect localhost:5555
//SON
import 'package:flutter/material.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/CountryDataList.dart';

class PageViewItem extends StatelessWidget {
  var MyVariableParametre = 3;

  //var detail ;
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
        print('TiTle : ${countrydata[index].country}');
        print('Id : ${countrydata[index].id}');

        print('TiTle : ${countrydata[index].country}');
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          '${countrydata[index].country}',
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

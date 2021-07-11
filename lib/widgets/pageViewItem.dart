// https://www.woolha.com/tutorials/flutter-creating-pageview-with-pagecontroller-examples
// adb connect localhost:5555

import 'package:flutter/material.dart';
import '../utils/mixins/CountryModelClass.dart';
import '../utils/mixins/CountryDataList.dart';

class PageViewItem extends StatelessWidget {

  Widget build(BuildContext context) {

    print("Name : ${countrydata[2].imageAsset}");

    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return PageView.builder(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      itemCount: 5 /*interests.length*/,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Text(
          '${'country.countrydata[1]'[index]}',
        );
      },
      /*
                const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
           */
    );
    //itembuilder()
  }
}

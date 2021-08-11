import 'package:flutter/material.dart';
import '../utils/mixins/CountryDataList.dart';

class PageViewItem extends StatelessWidget {
  final void Function(int myId, String myCountry) onChanged;
  const PageViewItem({this.onChanged});

  Container countryPageView() {
    final PageController controller = PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);

    return Container(
      color: Colors.red,
      height: 90,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: countryData.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: gestureDetectorOntap(index),
          );
        },
      ),
    );
  }

  GestureDetector gestureDetectorOntap(int index) {
    return GestureDetector(
      onTap: () {
        int myId = countryData[index].id;
        String myMenu = countryData[index].country;
        onChanged(myId, myMenu);
        print('myIDpageViewItem $myId');
        print('myMenupageViewItem  $myMenu');
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Text(
          '${countryData[index].country}',
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      child: countryPageView(),
    );
  }
}
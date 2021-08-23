import 'package:flutter/material.dart';
import '../utils/mixins/CountryDataList.dart';
import '../utils/mixins/CountryModelClass.dart';
import './Button.dart';

class PageViewItem extends StatefulWidget {
  final void Function(int myId, String myCountry) onChanged;
  const PageViewItem({this.onChanged});

  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  List<bool> selected = [
    false,
    false,
    false,
    false,
    false
  ]; // Trigger Button animation

  Container countryPageView() {
    //PageViewBuilder
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      height: 300,
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
/****/
  GestureDetector gestureDetectorOntap(int index) {
    String imageAsseto = countryData[index].imageAsset;
    return GestureDetector(
      onTap: () {
        //*****************************************************
        int myId = countryData[index].id; //Binding id
        String myMenu = countryData[index].country; //Binding country
        // Call the `onChanged` callback
        widget.onChanged(myId, myMenu); //Binding
        //*****************************************************
        setState(() {
          selected = [false, false, false, false, false];
          selected[index] = !selected[index];
        });
        //*****************************************************
      },
      child: Column(
        children: [
          SizedBox(height: 40),
          button(selected[index], imageAsseto),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: countryPageView(),
    );
  }
}

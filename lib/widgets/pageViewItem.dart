import 'package:flutter/material.dart';
import '../utils/mixins/CountryDataList.dart';
import './Button.dart';

class PageViewItem extends StatefulWidget {
  final void Function(int myId, String myCountry) onChanged;
  const PageViewItem({this.onChanged});

  @override
  _PageViewItemState createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  bool selected = false; // Trigger Button animation
  int select  ;

  Container countryPageView() {
    //PageViewBuilder
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.35);
    return Container(
      //color: Colors.red,
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

  GestureDetector gestureDetectorOntap(int index) {


    // Instance class MyButtonWidget ok but not necessary
    /*
        MyButtonWidgetState st = new MyButtonWidgetState();
    AnimatedContainer name = st.button(selected);
     */

    return GestureDetector(
      onTap: () {

        int myId = countryData[index].id;
        String myMenu = countryData[index].country;
        widget.onChanged(myId, myMenu);
        print('myIDpageViewItem $myId');
        print('myMenupageViewItem  $myMenu');
/*
        setState(() {
          select =  countryData[index].id;
          //selected = !selected;
          print('selected  $selected');
        });
 */

        setState(() {
          if (select == index) {
            //Si je clique a nouveau dessus , je suprime l'index (crt) et donc supprime l'affichage Si je ne met pas ce "null" , alors l'affichage reste definitevement
            select = null;
          } else {
            //crt = index fournit dans le GestureDetector , j'aurais pus le nommer index
            select =index; //j'ajoute mon index (crt) à ma selection
          }
        });

      },
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          button(select),
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


  Widget build(BuildContext context) {
    return Container(
      child: countryPageView(),
    );
  }
}

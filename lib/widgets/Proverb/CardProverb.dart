import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Menu/Menu.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';
import 'proverbDisplay.dart';
import 'dart:math'; //(Random)

class cardProverb extends StatelessWidget {
  final String text;
  final double size;
  //final FontWeight fontWeight;
  final Color color;
  //final double wordSpacing;
  //final VoidCallback onClick;
  final int index;

  const cardProverb({
    @required this.index,
    @required this.text,
    this.size,
    //this.fontWeight,
    this.color,
    //this.wordSpacing,
    //this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: index % 2 == 0
              ? Colors.lightBlue.withOpacity(0.4)
              : Colors.white.withOpacity(0.4),
          elevation: 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.format_quote, size: 40),
              ),
              ListTile(
                /*
                leading: Container(
                  margin: EdgeInsets.only( top: 1, left:1),
                  child: Icon(Icons.format_quote, size: 40),
                ),
                 */

                subtitle: Center(
                  //widthFactor: 0.5,
                  //padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(text,
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                ),

                /*
                trailing: Container(
                  //color: Colors.red,
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  //padding: EdgeInsets.only( bottom: 10),
                  // alignment: Alignment.bottomRight,
                  child: Icon(Icons.format_quote, size: 40),
                ),
                 */
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.format_quote, size: 40, color: Colors.red)),
            ],
          ),
        ),
      ],
    );
  }
}

// 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
import 'package:flutter/material.dart';
import 'Menu.dart';
import '../../utils/mixins/HelperFunction.dart';
import '../../utils/mixins/CountryModelClass.dart';

AnimatedContainer button(bool selected, String imageAsset) {
  return AnimatedContainer(
    duration: const Duration(seconds: 2),
    width: selected ? 120.0 : 100.0,
    height: selected ? 120.0 : 100.0,
    alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
    curve: Curves.fastOutSlowIn,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
          color: selected ? Colors.red[400] : Colors.blue,
          width: selected ? 5 : 10,
          style: selected ? BorderStyle.solid : BorderStyle.none),
      boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 0.0),
            blurRadius: 5.0,
            spreadRadius: 1.0)
      ],
      image: DecorationImage(
          //image: imageAsset,
          image: AssetImage(imageAsset),
          fit: BoxFit.cover),
    ),
  );
}

import 'package:flutter/material.dart';

class appColors {
  static const mainColor = Color(0xff1976D2);
  static const bodyText = Color(0xff121212);
  static const secondaryColor = Color(0xff787878);
}

class TextStyles {
  static TextStyle h1 = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontSize: 28.0,
    color: appColors.mainColor,
  );

  static TextStyle h2 = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    color: appColors.mainColor,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: appColors.bodyText,
  );

    static TextStyle secondaryText = const TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: appColors.secondaryColor,
  );
}

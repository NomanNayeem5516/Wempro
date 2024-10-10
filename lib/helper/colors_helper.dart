import 'package:flutter/material.dart';

class ColorsHelper {
  static final ColorsHelper _singleton = ColorsHelper._internal();

  factory ColorsHelper() {
    return _singleton;
  }
  ColorsHelper._internal();
  static const Color whiteColor=Colors.white;
  static const Color blackColor=Colors.black;
  static const Color primaryColor=Colors.blueGrey;
  static const Color blueColor=Colors.blue;
  // static const Color secondaryColor=Colors.black;
}
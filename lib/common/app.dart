import 'package:flutter/material.dart';

class App {
  static getAppWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getAppHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

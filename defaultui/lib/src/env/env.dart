import 'package:flutter/material.dart';
class Env {
  static String baseurl = "";

  String get getBaseUrl => baseurl;

  set setBaseUrl(String value) => baseurl = value;
  static Color appDrawerColor = Color.fromARGB(254, 18, 56, 85);
  static Color widgetHeaderColor = Color.fromARGB(157, 242, 244, 255);
   static Color menuSelectedColor = Color.fromARGB(254, 86,89, 227);
}

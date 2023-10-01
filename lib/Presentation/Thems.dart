import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Thems {
  static final light = ThemeData(
      backgroundColor: Colors.white,
      primaryColor: darkGreyClr,
      brightness: Brightness.light);
  static final dark = ThemeData(
      backgroundColor: Colors.black,
      primaryColor: darkGreyClr,
      brightness: Brightness.dark);

  TextStyle get headingStyle {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black);
  }
  TextStyle get subHeadingStyle {
    return TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black);
  }
  TextStyle get titleStyle {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? Colors.white : Colors.black);
  }
  TextStyle get subtitleStyle {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black);
  }
  TextStyle get bodyStyle {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.white : Colors.black);
  }
  TextStyle get body2Style {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Get.isDarkMode ? Colors.grey[200] : Colors.black);
  }
}

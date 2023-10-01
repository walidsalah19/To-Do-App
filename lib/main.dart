import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/AppRouts.dart';
import 'package:todoapp/Presentation/Screans/HomePage.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/services/theme_services.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  AppRouts appRouts=AppRouts();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Thems.light,
      darkTheme: Thems.dark,
      themeMode: ThemeServices().them,
      home: HomePage(),
    );
  }
}

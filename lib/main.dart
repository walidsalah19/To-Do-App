import 'package:flutter/material.dart';
import 'package:todoapp/AppRouts.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  AppRouts appRouts=AppRouts();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.teal,
        primaryColor: Colors.teal
      ),
      onGenerateRoute: appRouts.getRoutes,
    );
  }
}

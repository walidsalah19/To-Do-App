

import 'package:flutter/material.dart';
import 'package:todoapp/Presentation/Screans/HomePage.dart';
import 'package:todoapp/Presentation/Screans/NotificationScreen.dart';

class AppRouts{
  Route? getRoutes(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomePage());

      case '/notification':
        return MaterialPageRoute(
            builder: (_) =>  NotificationScreen(payLoad: "walid",));
    }
  }
}
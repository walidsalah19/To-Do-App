import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/AppRouts.dart';
import 'package:todoapp/Presentation/Screans/HomePage.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/services/notification_services.dart';
import 'package:todoapp/services/theme_services.dart';

import 'AdState.dart';
import 'BannerAD.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context, child) =>  MyApp(),
  ));
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


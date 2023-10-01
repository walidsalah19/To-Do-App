import 'package:flutter/material.dart';
import 'package:todoapp/services/theme_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon:const Icon(Icons.change_circle),
        ),
      ),
      body: Container(),
    );
  }
}

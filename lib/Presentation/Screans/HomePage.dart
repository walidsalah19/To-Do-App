import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Presentation/Screans/AddTaskPage.dart';
import 'package:todoapp/Presentation/Widget/button.dart';
import 'package:todoapp/Presentation/Widget/input_field.dart';
import 'package:todoapp/Presentation/size_config.dart';
import 'package:todoapp/services/theme_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchTheme();
          },
          icon: const Icon(Icons.change_circle),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyButton(
              lable: "tab this",
              onTab: () {
               // ThemeServices().switchTheme();
                Get.to(const AddTaskPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

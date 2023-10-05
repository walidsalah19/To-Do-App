import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Presentation/Screans/AddTaskPage.dart';
import 'package:todoapp/Presentation/Widget/button.dart';
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
      backgroundColor: context.theme.backgroundColor,
      appBar: _AppBar(),
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

  AppBar _AppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          setState(() {
            ThemeServices().switchTheme();
          });
        },
        icon: Icon(
          ! Get.isDarkMode ? Icons.sunny : Icons.nightlight,
          //color: Get.isDarkMode ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

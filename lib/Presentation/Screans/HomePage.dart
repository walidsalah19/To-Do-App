import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Presentation/Screans/AddTaskPage.dart';
import 'package:todoapp/Presentation/TaskController.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/Presentation/size_config.dart';
import 'package:todoapp/services/theme_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _AppBar(),
        body: Column(
          children: [
            _addTaskBar(),
            //_addDateBar(),
            const SizedBox(
              height: 6,
            ),
            // _showTasks()
          ],
        ));
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
          !Get.isDarkMode ? Icons.sunny : Icons.nightlight,
          //color: Get.isDarkMode ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  _showTasks() {}

  _addDateBar() {}

  Widget _addTaskBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Thems().subHeadingStyle,
              ),
              Text(
                "Today",
                style: Thems().subHeadingStyle,
              ),
            ],
          ),
          _addButton("+ Add Task", () async {
            await Get.to(() => const AddTaskPage());
            _taskController.getTasks();
          })
        ],
      ),
    );
  }

  Widget _addButton(String title, Function() onTab) {
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ));
  }
}

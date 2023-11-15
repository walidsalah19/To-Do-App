import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Presentation/Screans/AddTaskPage.dart';
import 'package:todoapp/Presentation/TaskController.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/Presentation/size_config.dart';
import 'package:todoapp/services/theme_services.dart';

import '../../services/notification_services.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();
  double _width = 200;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _AppBar(),
        body: Column(
          children: [
            _addTaskBar(),
            _addDateBar(),
            const SizedBox(
              height: 6,
            ),
            _showTasks()
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

  Widget _showTasks() {
    return _onTaskMessage(); /*Expanded(child:Obx((){
      if(*/ /*_taskController.taskList.isEmpty*/ /* true)
        {
          return _onTaskMessage();
        }else{
        return Container(height: 9,);
      }
    }));*/
  }

  Widget _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 100,
        initialSelectedDate: DateTime.now(),
        selectedTextColor: Colors.black,
        selectionColor: primaryClr,
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            print(_selectedDate);
          });
        },
      ),
    );
  }

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

  Widget _onTaskMessage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: _width),
              duration: const Duration(microseconds: 2000),
              builder: (BuildContext context, double wi, Widget? child) {
                return InkWell(
                  onTap: () {
                    setState(()  {
                      print("walid salah");
                      _width = _width == 200.0 ? 50.0 : 200.0;
                    });
                  },
                  child: SvgPicture.asset(
                    "images/task.svg",
                    width: _width,
                    height: _width, // You can adjust the height as needed
                  ),
                );
              }),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "No Tasks",
              style: TextStyle(
                color: primaryClr,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

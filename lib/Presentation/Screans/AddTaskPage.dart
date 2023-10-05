import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Presentation/Screans/HomePage.dart';
import 'package:todoapp/Presentation/TaskController.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/Presentation/Widget/button.dart';
import 'package:todoapp/Presentation/Widget/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController taskController = Get.put(TaskController());

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _dateTime = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectReminders = 5;
  List<int> _reminderList = [5, 10, 15, 20];
  String repeat = 'None';
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  int _selectColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar:_AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height:10),
            Text(
              "Add Task",
              style: Thems().headingStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              title: "Title",
              hint: "enter the Title",
              myController: _titleController,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              title: "Note",
              hint: "enter the Note",
              myController: _noteController,
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
              title: "Date",
              hint: DateFormat.yMd().format(_dateTime),
              widget: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.date_range),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: InputField(
                  title: "Start time",
                  hint: startTime,
                  widget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timelapse),
                  ),
                )),
                Expanded(
                    child: InputField(
                  title: "End time",
                  hint: endTime,
                  widget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.timelapse),
                  ),
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            InputField(
                title: "Reminder",
                hint: "$_selectReminders Minutes early",
                widget: DropdownButton(
                  items: _reminderList
                      .map<DropdownMenuItem<String>>(
                          (int value) => DropdownMenuItem<String>(
                              value: value.toString(),
                              child: Text(
                                "$value",
                                style: Thems().subtitleStyle,
                              )))
                      .toList(),
                  onChanged: (value2) {
                    setState(() {
                      _selectReminders = int.parse(value2!);
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    height: 0,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            InputField(
                title: "Repeat",
                hint: "$repeat",
                widget: DropdownButton(
                  items: repeatList
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Thems().subtitleStyle,
                              )))
                      .toList(),
                  onChanged: (value2) {
                    setState(() {
                      repeat = value2!;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    height: 0,
                  ),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorsCircles(),
                  MyButton(lable: "add task", onTab: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _colorsCircles() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: Thems().titleStyle,
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
            spacing: 10,
            children: List<Widget>.generate(
                3,
                (index) => InkWell(
                    onTap: () {
                      _changeColor(index);
                    },
                    child: CircleAvatar(
                      backgroundColor: index == 0
                          ? primaryClr
                          : index == 1
                              ? pinkClr
                              : orangeClr,
                      child: index == _selectColor
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16,
                            )
                          : null,
                    ))))
      ],
    );
  }

  _changeColor(int val) {
    setState(() {
      _selectColor = val;
    });
  }
  AppBar _AppBar()
  {
   return AppBar(
     leading: IconButton(
       icon: const Icon(Icons.arrow_back_ios,
       color: primaryClr,),
       onPressed: () {
         Get.to(HomePage());
       },
     ),
     elevation: 0,
     backgroundColor: context.theme.backgroundColor,
     title: Text(
     "To Do",
     style: Thems().titleStyle,
     ),
   ) ;
  }
}

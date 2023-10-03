import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        title: Text(
          "To Do",
          style: Thems().titleStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                              value:value.toString(),
                              child: Text(
                                "$value",
                                style: Thems().subtitleStyle,
                              )))
                      .toList(),
                  onChanged: (value2) {
                    setState(() {
                      _selectReminders =int.parse( value2!);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [MyButton(lable: "add task", onTab: () {})],
            )
          ],
        ),
      ),
    );
  }
}

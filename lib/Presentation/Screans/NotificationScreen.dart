import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Presentation/Widget/NotificationRow.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.payLoad});

  final String payLoad;

  @override
  State<StatefulWidget> createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  String _payLoad = '';

  @override
  void initState() {
    super.initState();
    _payLoad = widget.payLoad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(
          _payLoad,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello Walid",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You have new reminder $_payLoad",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).primaryColor),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationScreenWidget.generateRow(
                        const Icon(
                          Icons.text_format,
                          color: Colors.white,
                        ),
                        "Title"),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationScreenWidget.generateText(_payLoad),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationScreenWidget.generateRow(
                        const Icon(
                          Icons.description,
                          color: Colors.white,
                        ),
                        "Description"),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationScreenWidget.generateText(_payLoad),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    NotificationScreenWidget.generateRow(
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        "Date"),
                    NotificationScreenWidget.generateText(_payLoad),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

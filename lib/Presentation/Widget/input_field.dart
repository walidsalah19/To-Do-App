import 'package:flutter/material.dart';
import 'package:todoapp/Presentation/size_config.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.title,
      required this.note,
      this.myController,
      this.widget})
      : super(key: key);
  final String title;
  final String note;
  final TextEditingController? myController;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          width: SizeConfig.screenWidth,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey)),
          child: TextFormField(

            decoration: InputDecoration(
              labelText: title,
            ),
          )),
    );
  }
}

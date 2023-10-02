import 'package:flutter/material.dart';
import 'package:todoapp/Presentation/Thems.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.lable, required this.onTab})
      : super(key: key);
  final String lable;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: 100,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: orangeClr,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Text(
          lable,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

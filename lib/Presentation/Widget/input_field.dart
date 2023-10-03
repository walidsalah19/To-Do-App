import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/Presentation/Thems.dart';
import 'package:todoapp/Presentation/size_config.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.myController,
      this.widget})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? myController;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Text(title, style: Thems().subtitleStyle),
        ),
        Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: SizeConfig.screenWidth,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: hint,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.backgroundColor
                        ),
                      ),
                    ),
                    controller: myController,
                    autofocus: false,
                    cursorColor: Get.isDarkMode?Colors.white:darkGreyClr,
                    readOnly: widget==null?false:true,
                    style: Thems().subtitleStyle,
                  ),
                ),
                widget ??Container(),
              ],
            )),
      ],
    );
  }
}

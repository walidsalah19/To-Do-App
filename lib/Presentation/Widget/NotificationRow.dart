

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreenWidget{
  static Widget generateRow(Icon icon,String text)
  {
    return Row(
      children: [
        icon,
        SizedBox(width: 10,),
        Text(
          text,
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ],
    );
  }
  static Widget generateText(String text)
  {
    return  Text(
     textAlign: TextAlign.start,
      text,
      style: const TextStyle(fontSize: 22, color: Colors.white),
    );
  }
}
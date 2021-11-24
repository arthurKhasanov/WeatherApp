import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Класс для получаения строки с отформатированной датой "Mon, Nov 22, 2021"
class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
  //Вспомогательный виджет
  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.black87,
          size: 28,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 20, color: Colors.black87),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$units',
          style: TextStyle(fontSize: 15, color: Colors.black87),
        )
      ],
    );
  }
}

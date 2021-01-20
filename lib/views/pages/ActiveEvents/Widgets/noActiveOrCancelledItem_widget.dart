import 'package:flutter/material.dart';

Widget noActiveOrCancelleditem_widget(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.orange,
    ),
    padding: EdgeInsets.only(top: 15),
    alignment: Alignment.topCenter,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

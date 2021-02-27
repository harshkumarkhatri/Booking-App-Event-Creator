import 'package:flutter/material.dart';

Widget itemText(String text) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

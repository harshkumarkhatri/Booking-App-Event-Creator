import 'package:flutter/material.dart';

Widget chooseText(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 6.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}

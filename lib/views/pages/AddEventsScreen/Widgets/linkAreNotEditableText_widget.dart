import 'package:flutter/material.dart';

Widget linkAreNotEditablet_widget() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(
      top: 4,
    ),
    child: Text(
      "Event link cannot be changed later. Make sure to include 'http' or 'https' at the begining",
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

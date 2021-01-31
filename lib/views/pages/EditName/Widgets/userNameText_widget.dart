import 'package:flutter/material.dart';

Widget userNameText_widget(String userName) {
  return Container(
    child: Text(
      userName,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

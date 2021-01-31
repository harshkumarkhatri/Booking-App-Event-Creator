import 'package:flutter/material.dart';

InputDecoration textField_inputDecoration() {
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    ),
    icon: Icon(
      Icons.supervised_user_circle_outlined,
    ),
  );
}

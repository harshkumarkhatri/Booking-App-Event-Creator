import 'package:flutter/material.dart';

InputDecoration textFormField_inputDecoration(
    String labelText, String helperText) {
  return InputDecoration(
    alignLabelWithHint: true,
    focusColor: Colors.black,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.black),
    helperText: helperText,
    errorStyle: TextStyle(color: Colors.black, fontSize: 16.0),
  );
}

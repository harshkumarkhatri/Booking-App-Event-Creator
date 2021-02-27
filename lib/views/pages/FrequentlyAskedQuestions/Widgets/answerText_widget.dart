import 'package:flutter/material.dart';

Widget answerText_widget(String text) {
  return new AnimatedContainer(
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    duration: const Duration(milliseconds: 120),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        text,
        style: TextStyle(
          color: Colors.orange,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.6,
          height: 1.1,
        ),
      ),
    ),
  );
}

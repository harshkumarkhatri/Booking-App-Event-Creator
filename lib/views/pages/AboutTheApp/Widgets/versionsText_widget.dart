import 'package:flutter/material.dart';

Widget versionText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 36.0),
    child: Container(
      child: Text(
        "Version 1.0.0",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.3,
        ),
      ),
    ),
  );
}

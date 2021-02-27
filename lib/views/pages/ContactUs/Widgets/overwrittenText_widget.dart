import 'package:flutter/material.dart';

Widget overwrittenText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Container(
      child: Text(
        "At a time you can only have one contact request.\nMaking a new contact request will overwrite your current request.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

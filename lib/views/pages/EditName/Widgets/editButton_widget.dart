import 'package:flutter/material.dart';

Widget editButton_widget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0),
    child: Container(
      alignment: Alignment.center,
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          14,
        ),
      ),
      child: Text(
        "Edit",
        style: TextStyle(
          color: Colors.orange,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.3,
        ),
      ),
    ),
  );
}

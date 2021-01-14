import 'package:flutter/material.dart';

Widget editYourUserNameText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Text(
      "You can edit your username through the\n\"Edit My Name\" option in Settings.",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

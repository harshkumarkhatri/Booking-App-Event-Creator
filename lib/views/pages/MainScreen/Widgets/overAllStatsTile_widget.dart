import 'package:flutter/material.dart';

Widget overAllStateTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Overall Stats',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      // Update the state of the app.
      // ...
    },
  );
}

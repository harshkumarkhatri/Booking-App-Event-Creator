import 'package:flutter/material.dart';

Widget createNewEventTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Create New Events',
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

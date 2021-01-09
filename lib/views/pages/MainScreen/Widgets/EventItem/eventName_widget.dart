import 'package:flutter/material.dart';

Widget eventName_widget(dynamic snapshot, int index) {
  return Container(
    child: Text(
      snapshot.data["${index + 1}"]['eventName'].toString(),
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget eventStatusText_widget(dynamic snapshot, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Container(
      child: Text(
        "Event Status:-" +
            snapshot.data["${index + 1}"]['eventStatus']
                .toString()
                .toUpperCase(),
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

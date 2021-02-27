import 'package:flutter/material.dart';

Widget whatsNewItem_widget(var json, int index) {
  return Container(
    padding: EdgeInsets.only(
      top: 18.0,
    ),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            json["${index + 1}"]['heading'],
            style: TextStyle(
              shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
              decoration: TextDecoration.underline,
              decorationColor: Colors.black45,
              decorationThickness: 4.0,
              decorationStyle: TextDecorationStyle.dashed,
              color: Colors.transparent,
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: Text(
            json["${index + 1}"]['body'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

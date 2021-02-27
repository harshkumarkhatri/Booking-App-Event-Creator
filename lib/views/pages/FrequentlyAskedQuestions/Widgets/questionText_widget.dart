import 'package:flutter/material.dart';

Widget questionText_widget(String text) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.all(
        8.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.orange,
              ),
            ),
          ),
          Icon(
            Icons.arrow_circle_down,
            color: Colors.orange,
          ),
        ],
      ),
    ),
  );
}

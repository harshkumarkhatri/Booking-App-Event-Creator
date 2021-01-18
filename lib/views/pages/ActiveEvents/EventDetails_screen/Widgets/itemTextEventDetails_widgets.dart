import 'package:flutter/material.dart';

Widget itemTextEventDetails_widget(String item, String contactEmail) {
  return Row(
    children: [
      Container(
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Spacer(),
      Container(
        child: Text(
          contactEmail,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}

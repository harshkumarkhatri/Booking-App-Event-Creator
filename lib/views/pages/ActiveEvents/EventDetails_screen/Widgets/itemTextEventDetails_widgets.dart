import 'package:flutter/material.dart';

Widget itemTextEventDetails_widget(String item, String contactEmail) {
  return Row(
    children: [
      Container(
        child: Text(
          item,
          maxLines: 9,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Spacer(),
      Flexible(
        child: Container(
          child: Text(
            contactEmail,
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      )
    ],
  );
}

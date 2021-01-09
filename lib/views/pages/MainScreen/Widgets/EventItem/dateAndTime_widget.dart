import 'package:flutter/material.dart';

Widget dateAndTime_widget(dynamic snapshot, int index) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.calendar_today, color: Colors.orange),
        Container(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            snapshot.data["${index + 1}"]['date'].toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.only(right: 8),
          child: Text(
            snapshot.data["${index + 1}"]['time'].toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Icon(
          Icons.lock_clock,
          color: Colors.orange,
        ),
      ],
    ),
  );
}

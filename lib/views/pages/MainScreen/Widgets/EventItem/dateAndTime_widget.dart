import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget dateAndTime_widget(dynamic snapshot, int index, String email) {
  FieldPath field = FieldPath.fromString(email);
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.calendar_today, color: Colors.orange),
        Container(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Text(
            snapshot.data["${index + 1}_${field.hashCode}"]['date'].toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.only(
            right: 8.0,
          ),
          child: Text(
            snapshot.data["${index + 1}_${field.hashCode}"]['time'].toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget eventStatusText_widget(dynamic snapshot, int index, String email) {
  FieldPath field = FieldPath.fromString(email);

  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Container(
      child: Text(
        "Event Status:-" +
            snapshot.data["${index + 1}_${field.hashCode}"]['eventStatus']
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

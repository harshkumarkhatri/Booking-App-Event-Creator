import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget eventName_widget(dynamic snapshot, int index, String email) {
  FieldPath field = FieldPath.fromString(email);

  return Container(
    child: Text(
      snapshot.data["${index + 1}_${field.hashCode}"]['eventName'].toString(),
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

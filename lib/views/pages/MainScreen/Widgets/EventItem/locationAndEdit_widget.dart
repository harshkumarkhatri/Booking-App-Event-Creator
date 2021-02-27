import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditEvent/editEvent_screen.dart';
import 'package:get/get.dart';

Widget locationAndEdit_widget(dynamic snapshot, int index, String email) {
  FieldPath field = FieldPath.fromString(email);

  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Row(
      children: [
        Icon(Icons.location_on, color: Colors.orange),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              snapshot.data['${index + 1}_${field.hashCode}']['eventCity']
                      .toString() +
                  ", " +
                  snapshot.data['${index + 1}_${field.hashCode}']["eventState"]
                      .toString(),
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(EditEventScreen(index: index + 1));
          },
          child: Icon(
            Icons.edit,
            color: Colors.orange,
          ),
        )
      ],
    ),
  );
}

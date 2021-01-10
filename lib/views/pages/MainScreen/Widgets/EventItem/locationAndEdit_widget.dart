import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditEvent/editEvent_screen.dart';
import 'package:get/get.dart';

Widget locationAndEdit_widget(dynamic snapshot, int index) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: Row(
      children: [
        Icon(Icons.location_on, color: Colors.orange),
        Container(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            snapshot.data['${index + 1}']['eventCity'].toString() +
                ", " +
                snapshot.data['${index + 1}']["eventState"].toString(),
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
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

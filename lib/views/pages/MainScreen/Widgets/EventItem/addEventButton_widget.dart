import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/addEvents_screen.dart';
import 'package:get/get.dart';

Widget addEventButton() {
  return RaisedButton(
    onPressed: () {
      Get.to(AddEvents());
    },
    color: Colors.black,
    textColor: Colors.orange,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        14.0,
      ),
    ),
    elevation: 12.0,
    child: Container(
      child: Text(
        "Add event".toUpperCase(),
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
      ),
    ),
  );
}

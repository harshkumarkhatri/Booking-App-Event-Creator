import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/addEvents_screen.dart';
import 'package:get/get.dart';

Widget createNewEventTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Create New Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(AddEvents());
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/activeEvents_screen.dart';
import 'package:get/get.dart';

Widget activeEventTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      '         Active Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(ActiveEventsScreen());
    },
  );
}

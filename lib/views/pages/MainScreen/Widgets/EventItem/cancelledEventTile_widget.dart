import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/CancelledEvents/cancelledEvents_screen.dart';
import 'package:get/get.dart';

Widget cancelledEventTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      '         Cancelled Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(CancelledEventsScreen());
    },
  );
}

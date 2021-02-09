import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/PastEvents/pastEvents_screen.dart';
import 'package:get/get.dart';

Widget pastEventTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      '         Past Events',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.back();
      Get.to(PastEventsScreen());
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/OverallStats/overallStats_screen.dart';
import 'package:get/get.dart';

Widget overAllStateTile() {
  return ListTile(
    tileColor: Colors.black,
    title: Text(
      'Overall Stats',
      style: TextStyle(
        color: Colors.orange,
        fontWeight: FontWeight.w600,
      ),
    ),
    onTap: () {
      Get.to(OverallStats());
    },
  );
}

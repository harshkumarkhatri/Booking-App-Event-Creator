import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheUser/aboutTheUser_screen.dart';
import 'package:get/get.dart';

Widget aboutTheUserTile() {
  return ListTile(
    title: Text('About the User'),
    onTap: () {
      // Update the state of the app.
      // ...
      Get.to(AboutTheUser());
    },
  );
}

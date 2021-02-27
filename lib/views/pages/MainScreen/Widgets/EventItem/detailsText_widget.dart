import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/RegisteredUsers/registeredUsers_screen.dart';
import 'package:get/get.dart';

Widget detailsText_widget(dynamic snapshot, int index, String email) {
  FieldPath field = FieldPath.fromString(email);

  return GestureDetector(
    onTap: () {
      Get.to(RegisteredUsers(snapshot, index, email));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Text(
          "Registered Users",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
      ),
    ),
  );
}

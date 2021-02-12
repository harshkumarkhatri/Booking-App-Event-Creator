import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/logoutUser.dart';
import 'package:get/get.dart';

Widget logout_widget(IconData icon, String text) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      loggingOut();
    },
    child: Container(
      // color: Colors.pink,
      alignment: Alignment.centerLeft,
      height: 45,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(icon),
          ),
          Text(
            text,
            style: TextStyle(
              // color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );
}

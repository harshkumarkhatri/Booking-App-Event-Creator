import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';

Widget versionText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 36.0),
    child: Container(
      child: Text(
        Constants.versionText,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.3,
        ),
      ),
    ),
  );
}

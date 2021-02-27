import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';

Widget linkAreNotEditablet_widget() {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(
      top: 4.0,
    ),
    child: Text(
      Constants.linkAreNotEditableText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

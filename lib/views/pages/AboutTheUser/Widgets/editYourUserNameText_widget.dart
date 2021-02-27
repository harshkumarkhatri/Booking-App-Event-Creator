import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';

Widget editYourUserNameText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0),
    child: Text(
      Constants.editYourUserNameText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

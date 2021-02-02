import 'package:flutter/material.dart';

Widget aboutTheAppText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      child: Text(
        "Eventizer is an app that helps you to create or schedule your events on the go and let people know about the things which you are organizing. This app is the event registering app through which you can add your events, edit your events, change the status of your events, and view the overall stats for your event. Every time a new event is created, users can register for your event.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.4,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

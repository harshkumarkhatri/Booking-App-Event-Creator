import 'package:flutter/material.dart';

Widget aboutTheAppText_widget() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Container(
      child: Text(
        "Eventizer is an app that helps you to create or schedule your events on the go and let people know about the events which you are organizing. hrough this app you can let masses know about your event and increase the reach of your event. Every time a new event is created, users will be getting a notification/mail about it and then they can register for your event.",
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

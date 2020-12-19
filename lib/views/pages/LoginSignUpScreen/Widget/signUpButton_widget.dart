import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SignUpScreen/signUp_screen.dart';
import 'package:get/get.dart';

Widget signupButton(context) {
  return GestureDetector(
    onTap: () {
      Get.to(SignUpScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        // color: Colors.yellow,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.yellow[400],
              Colors.yellow,
              Colors.yellow[600],
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/auth/googleLogin_auth.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:get/get.dart';

Widget signUpWithGoogleButton() {
  return GestureDetector(
    onTap: () {
      Future<String> output = handleSignIn();
      output.then((value) {
        value == "Success"
            ? Get.offAll(MainScreen())
            : Get.snackbar("Unsuccessful Singup", "Please try again.");
      });
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.0,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Sign Up with Google",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.6,
              color: Colors.orange,
            ),
          ),
        ),
      ),
    ),
  );
}

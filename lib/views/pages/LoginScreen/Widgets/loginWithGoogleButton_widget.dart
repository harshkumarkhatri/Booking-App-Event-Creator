import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/auth/googleLogin_auth.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:get/get.dart';

Widget loginWithGoogleButton() {
  return GestureDetector(
    onTap: () {
      Future<String> output = handleSignIn();
      output.then((value) {
        value == "Success"
            ? Get.offAll(MainScreen())
            : Get.snackbar("Unsuccessful Login", "Please try again.");
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
              Colors.orange[400],
              Colors.orange,
              Colors.orange[600],
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Login with Google",
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.6,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}

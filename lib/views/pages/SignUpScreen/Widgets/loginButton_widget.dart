import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/login_screen.dart';
import 'package:get/get.dart';

Widget loginButtonSignUpScreen() {
  return GestureDetector(
    onTap: () {
      Get.off(LoginScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 58.0, top: 25.0),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
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
            "Login",
            style: TextStyle(
              fontSize: 32.0,
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

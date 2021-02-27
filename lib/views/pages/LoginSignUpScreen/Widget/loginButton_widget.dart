import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/login_screen.dart';
import 'package:get/get.dart';

Widget loginButton(context) {
  return GestureDetector(
    onTap: () {
      Get.to(LoginScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    ),
  );
}

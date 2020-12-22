import 'package:flutter/material.dart';

Widget signUpWithGoogleButton() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25.0),
    child: Container(
      height: 55,
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
          "Sign Up with Google",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/auth/signup_auth.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:get/get.dart';

Widget signUpButtonSignUpScreen(BuildContext context,
    GlobalKey<FormState> _formKey, String email, String password) {
  return GestureDetector(
    onTap: () {
      if (_formKey.currentState.validate()) {}
      Future<String> op = signUp(email, password, _formKey);

      op.then(
        (value) {
          value == "Success"
              ? Get.offAll(MainScreen())
              : Get.snackbar("SignUp Error", "Please try again later.",
                  snackPosition: SnackPosition.BOTTOM);
        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55.0,
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
            "Sign Up",
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

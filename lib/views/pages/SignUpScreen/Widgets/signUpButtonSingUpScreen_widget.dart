import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/auth/signup_auth.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:get/get.dart';

Widget signUpButtonSignUpScreen(BuildContext context,
    GlobalKey<FormState> _formKey, String email, String password) {
  return GestureDetector(
    onTap: () {
      if (_formKey.currentState.validate()) {
        // If the form is valid, display a Snackbar.
        // Scaffold.of(context).showSnackBar(
        //     SnackBar(content: Text('Processing Data')));
      }
      Future<String> op = signUp(email, password, _formKey);
      print(
        op.then(
          (value) {
            print(value);
            value == "Success"
                ? Get.offAll(MainScreen())
                : Get.snackbar("SignUp Error",
                    "We cannot sign you up with these credentials.\nPlease try again with another credentials.",
                    snackPosition: SnackPosition.BOTTOM);
          },
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
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
            "Sign Up",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.6,
              color: Colors.red,
            ),
          ),
        ),
      ),
      //  ElevatedButton(
      //   onPressed: () {
      //     // Validate returns true if the form is valid, or false
      //     // otherwise.
      // if (_formKey.currentState.validate()) {
      //   // If the form is valid, display a Snackbar.
      //   // Scaffold.of(context).showSnackBar(
      //   //     SnackBar(content: Text('Processing Data')));
      // }
      //   },
      //   child: Text('Submit'),
      // ),
    ),
  );
}

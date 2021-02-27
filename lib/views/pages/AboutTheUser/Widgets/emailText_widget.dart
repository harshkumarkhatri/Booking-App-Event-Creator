import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget emailText_widget(User user) {
  return Container(
    padding: EdgeInsets.only(
      top: 15.0,
      bottom: 15.0,
      left: 4.0,
      right: 4.0,
    ),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(
        14.0,
      ),
    ),
    child: Text(
      "Email:- " + user.email ?? "email",
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

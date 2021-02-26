import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget emailText_widget(User user) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
      bottom: 15,
      left: 4,
      right: 4,
    ),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(
        14,
      ),
    ),
    child: Text(
      "Email:- " + user.email ?? "email",
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

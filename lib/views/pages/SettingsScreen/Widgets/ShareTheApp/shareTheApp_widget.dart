import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

Widget shareTheApp_widget(IconData icon, String text) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Share.share(
        "Want to create and manage your events at a place? \nDownload the app now: https://bit.ly/iamharsh",
        subject: "Managing Events Effectivly",
      );
    },
    child: Container(
      // color: Colors.pink,
      alignment: Alignment.centerLeft,
      height: 45,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(icon),
          ),
          Text(
            text,
            style: TextStyle(
              // color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    ),
  );
}

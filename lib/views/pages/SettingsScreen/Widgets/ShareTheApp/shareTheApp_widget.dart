import 'package:flutter/material.dart';
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
      alignment: Alignment.centerLeft,
      height: 45.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15.0,
            ),
            child: Icon(icon),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
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

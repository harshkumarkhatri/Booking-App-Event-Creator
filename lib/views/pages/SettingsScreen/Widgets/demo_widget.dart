import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget demoWidget(IconData icon, String text, Widget page) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Get.to(page);
    },
    child: Container(
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

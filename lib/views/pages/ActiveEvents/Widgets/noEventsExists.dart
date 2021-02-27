import 'package:flutter/material.dart';

Widget noEventsExists(BuildContext context, String text) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: Colors.orange),
    alignment: Alignment.topCenter,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

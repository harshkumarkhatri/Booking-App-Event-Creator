import 'package:flutter/material.dart';

Widget contactUs_widget(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 55.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Colors.black.withOpacity(0.6),
          Colors.black.withOpacity(0.7),
          Colors.black.withOpacity(0.8),
        ],
      ),
    ),
    child: Center(
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.6,
          color: Colors.orange.withOpacity(0.6),
        ),
      ),
    ),
  );
}

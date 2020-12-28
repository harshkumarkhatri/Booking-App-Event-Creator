import 'package:flutter/material.dart';

Widget drawerHeader() {
  return Container(
    height: 150,
    child: DrawerHeader(
      child: Container(
        // decoration: BoxDecoration(color: Colors.orange),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            Container(
              child: Text(
                "demo@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.pink,
      ),
    ),
  );
}

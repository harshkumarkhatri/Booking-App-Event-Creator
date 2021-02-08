import 'package:flutter/material.dart';

Widget drawerHeader() {
  return Container(
    height: 80,
    child: DrawerHeader(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                "demo@gmail.com",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.orange,
    ),
  );
}

import 'package:flutter/material.dart';

Widget drawerHeader(String email) {
  return Container(
    height: 80.0,
    child: DrawerHeader(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Text(
                email ?? "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
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

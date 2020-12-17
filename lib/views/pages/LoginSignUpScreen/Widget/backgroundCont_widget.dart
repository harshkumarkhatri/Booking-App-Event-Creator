import 'package:flutter/material.dart';

Widget backgroundContainers(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          color: Colors.red,
          height: 225,
          child: Container(
            height: 65,
            width: 65,
            // color: Colors.yellow,
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            // height: (2 * MediaQuery.of(context).size.height) / 3,
          ),
        ),
      ],
    ),
  );
}

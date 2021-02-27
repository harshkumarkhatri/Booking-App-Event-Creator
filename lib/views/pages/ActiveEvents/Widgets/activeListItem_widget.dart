import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/EventDetails_screen/eventDetails_screen.dart';
import 'package:get/get.dart';

Widget activeListItem_widget(
    DocumentSnapshot demoThing, int index, FieldPath field) {
  return GestureDetector(
    onTap: () {
      Get.to(
        EventDetailsScreen(
          data: demoThing.data()["${index + 1}_${field.hashCode}"],
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            14,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                top: 6.0,
                bottom: 2.0,
              ),
              child: Container(
                child: Text(
                  demoThing.data()["${index + 1}_${field.hashCode}"]
                      ["eventName"],
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 2.0,
                bottom: 6.0,
                right: 12.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.orange),
                  Flexible(
                    child: Text(
                      demoThing.data()["${index + 1}_${field.hashCode}"]
                              ["eventCity"] +
                          ", " +
                          demoThing.data()["${index + 1}_${field.hashCode}"]
                              ["eventState"],
                      maxLines: 9,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  Flexible(
                    child: Text(
                      demoThing.data()["${index + 1}_${field.hashCode}"]
                          ["date"],
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 9,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// This function adds the new event to firestore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_booking_app_event_creator/blocs/mainScreen_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'sendFcmMessage.dart';

CollectionReference users = Firestore.instance.collection("eventList");

void addingDataToFireStore(
    uid,
    String fullUserName,
    String contactEmail,
    String phoneNumber,
    String eventCity,
    String eventState,
    String eventType,
    String expectedAudience,
    String date,
    String time,
    String eventName,
    String eventURL) async {
  try {
    if (fullUserName == null ||
        contactEmail == null ||
        phoneNumber == null ||
        eventState == null ||
        eventCity == null ||
        eventType == null ||
        expectedAudience == null ||
        date == null ||
        time == null ||
        eventName == null) {
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User _user = auth.currentUser;
      final FlutterSecureStorage storage = FlutterSecureStorage();
      String email = await storage.read(key: "email");
      int lengthOfData;
      final demoThing = await Firestore.instance
              .collection("eventList")
              .document(email)
              .get()
              .then((value) {
            int length;
            if (value.data() == null) {
              length = 0;
            } else {
              length = value.data().length;
            }
            lengthOfData = length + 1;
          }) ??
          null;
      FieldPath field = FieldPath.fromString(email);
      users.document(email).updateData({
        "${lengthOfData.toString()}_${field.hashCode}" ?? "1_${field.hashCode}":
            {
          "fullUserName": fullUserName,
          "contactEmail": contactEmail,
          "phoneNumber": phoneNumber,
          "eventState": eventState,
          "eventCity": eventCity,
          "eventType": eventType,
          "expectedAudience": expectedAudience,
          "date": date,
          "time": time,
          "eventStatus": "active",
          "eventName": eventName,
          "eventURL": eventURL,
          "registeredUsers": []
        },
      });
    }
    sendFcmMessage(
        "New Event Published", "Check out $eventName and register for it.");
    Get.back();
    final mainScreen_bloc = MainScreenBloc();
    mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
  } catch (e) {
    Get.snackbar("Error",
        "Unable to add a new event at the moment.\nPleae try after some time");
  }
}

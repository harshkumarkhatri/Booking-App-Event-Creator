// This function creates a new blank data entry as soon as the user logs into the app

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

CollectionReference users = Firestore.instance.collection("eventList");

void createBlankDataEntry(
  uid,
) async {
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User _user = auth.currentUser;

    users.document(uid).set({});

    // Get.back();
  } catch (e) {
    Get.snackbar("Error",
        "Unable to add a new event at the moment.\nPleae try after some time");
  }
}

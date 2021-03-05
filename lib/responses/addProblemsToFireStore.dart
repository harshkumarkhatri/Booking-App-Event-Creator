// This function adds the problem which users are facing to firestore in the 'contactUs' collection

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

CollectionReference users = Firestore.instance.collection("contactUs");

void addProblemsToFireStore(String name, String desc) async {
  try {
    if (name == null || desc == null) {
    } else {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User _user = auth.currentUser;
      FlutterSecureStorage storage = FlutterSecureStorage();
      String email = await storage.read(key: "email");
      users.document(email).set({
        "name": name,
        "desc": desc,
        "status": "unanswered",
      });
      Get.back();
      Get.snackbar(
        "Contact request added",
        "You will be getting a mail on your registered email address.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.orange,
        duration: Duration(
          seconds: 5,
        ),
      );
    }
  } catch (e) {}
}

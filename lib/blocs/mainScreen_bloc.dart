// Bloc for the main screen which continously updates the event when a new event is added or deleted

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

enum MainScreenActions { Fetch }

class MainScreenBloc {
  final streamController = StreamController();
  StreamSink get mainScreenSink => streamController.sink;
  Stream get mainScreenStream => streamController.stream;

  final eventController = StreamController();
  StreamSink get eventSink => eventController.sink;
  Stream get eventStream => eventController.stream;

  MainScreenBloc() {
    eventStream.listen((event) async {
      if (event == MainScreenActions.Fetch) {
        try {
          final FirebaseAuth auth = FirebaseAuth.instance;

          final User user = auth.currentUser;
          final _data = await Firestore.instance
              .collection("eventList")
              .document(user.email)
              .get();
          final demoThing = await Firestore.instance
              .collection("eventList")
              .document(user.email)
              .get()
              .then((value) {
            if (value.data() != null) {
              mainScreenSink.add(value.data());
            } else {
              mainScreenSink.addError(
                  "No Event Found.\nStart creating your first event.");
            }
          });
        } catch (e) {
          // To check if the state is bad
          // If we have bad state, we will not display the snackbar
          if (e.toString().substring(0, 3) != "Bad")
            Get.snackbar("Error", "Something wrong. Please restart the app.");
        }
      }
    });
  }

  void dispose() {
    streamController.close();
    eventController.close();
  }
}

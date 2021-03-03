// This function add all the event creators to a particular topic 'eventCreators' and then we can send FCM notifications to this topic

import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

void subToTopic_fcm() {
  _firebaseMessaging.subscribeToTopic('eventCreators');
}

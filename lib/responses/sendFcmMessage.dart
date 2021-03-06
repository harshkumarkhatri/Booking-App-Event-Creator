// This function sends a FCM notifications to the users who are subscribed to ;eventCreators' topic.

import 'dart:convert';
import 'package:flutter_booking_app_event_creator/utils/impData.dart';
import 'package:http/http.dart';

Future<bool> sendFcmMessage(String title, String message) async {
  try {
    var url = 'https://fcm.googleapis.com/fcm/send';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "key=${impData().fcmKey}",
    };
    var request = {
      "notification": {
        "title": title,
        "text": message,
        "sound": "default",
        "color": "#990000",
      },
      "priority": "high",
      "to": "/topics/eventCreators",
    };

    var client = new Client();
    var response =
        await client.post(url, headers: header, body: json.encode(request));
    return true;
  } catch (e, s) {
    return false;
  }
}

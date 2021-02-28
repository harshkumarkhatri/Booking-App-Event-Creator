// Logs the user out and sets the email and uid back to null

import 'package:flutter_booking_app_event_creator/views/pages/LoginSignUpScreen/loginSignup_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void loggingOut() async {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  storage.write(key: "email", value: null);
  storage.write(key: "uid", value: null);
  Get.offAll(LoginSignUpScreen());
}

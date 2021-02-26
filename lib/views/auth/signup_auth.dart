// This adds the sign up with email and password in our app.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_booking_app_event_creator/responses/createBlankDataEntry.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> signUp(email, password, formKey) async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final formState = formKey.currentState;
  if (formState.validate()) {
    formState.save();

    // Trying to sign up
    try {
      UserCredential result = (await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password));

      final FlutterSecureStorage storage = FlutterSecureStorage();
      storage.write(key: "email", value: result.user.email);
      storage.write(key: "uid", value: result.user.uid);
      createBlankDataEntry(result.user.uid);
      return "Success";
    } catch (e) {
      return "Fail";
    }
  }
}

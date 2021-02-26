// This adds login authentication with email and pasword in our app.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> signin(email, password, formKey) async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final formState = formKey.currentState;

  // Validating formstate
  if (formState.validate()) {
    formState.save();

    // Trying to log in
    try {
      UserCredential result = (await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password));

      // Flutter secure storage
      final FlutterSecureStorage storage = FlutterSecureStorage();
      storage.write(key: "email", value: result.user.email);
      storage.write(key: "uid", value: result.user.uid);

      return "Success";
    } catch (e) {
      return "Fail";
    }
  }
}

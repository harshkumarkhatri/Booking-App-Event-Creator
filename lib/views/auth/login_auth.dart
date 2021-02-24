import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print(result);

      // Flutter secure storage
      print("Starting with secure storage");
      final FlutterSecureStorage storage = FlutterSecureStorage();
      storage.write(key: "email", value: result.user.email);
      storage.write(key: "uid", value: result.user.uid);
      print("Ending secure storage");

      print("Yha login hua hai");
      return "Success";
    } catch (e) {
      return "Fail";
    }
  }
}

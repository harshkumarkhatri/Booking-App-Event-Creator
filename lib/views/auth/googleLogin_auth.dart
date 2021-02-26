// This adds google login authentication for our app.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String> handleSignIn() async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  try {
    GoogleSignInAccount googleSignInAccount = await _handleGoogleSignIn();
    final googleAuth = await googleSignInAccount.authentication;
    final googleAuthCred = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final user = await _firebaseAuth.signInWithCredential(googleAuthCred);

    final FlutterSecureStorage storage = FlutterSecureStorage();
    storage.write(key: "email", value: user.user.email);
    storage.write(key: "uid", value: user.user.uid);
    return "Success";
  } catch (error) {
    return "Fail";
  }

  return "Fail";
}

// Sign in with google
Future<GoogleSignInAccount> _handleGoogleSignIn() async {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  return googleSignInAccount;
}

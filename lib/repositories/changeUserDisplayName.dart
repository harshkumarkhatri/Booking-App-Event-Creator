// This change the name of the user and set the name to new name entered through the text field.

import 'package:firebase_auth/firebase_auth.dart';

void changeUserDisplayName(dispName) {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final User _user = auth.currentUser;
  _user.updateProfile(displayName: dispName);
}

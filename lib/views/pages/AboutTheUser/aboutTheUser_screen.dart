import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutTheUser extends StatefulWidget {
  @override
  _AboutTheUserState createState() => _AboutTheUserState();
}

class _AboutTheUserState extends State<AboutTheUser> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  void inputData() {
    final User _user = auth.currentUser;
    // final uid = user.uid;
    // here you write the codes to input the data into firestore

    setState(() {
      user = _user;
    });

    print(user.uid);
    // print(uid);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About the User"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(user.email ?? "email"),

            // TODO: see if username is present or not.
            // If not present then type no name found and provide them with an option to add name, phone nummber.
            Text(user.displayName == "" ? "demo" : user.displayName) ??
                "No name found"
          ],
        ),
      ),
    );
  }
}

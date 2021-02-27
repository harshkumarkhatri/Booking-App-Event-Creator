import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheUser/Widgets/editYourUserNameText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheUser/Widgets/emailText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheUser/Widgets/nameText_widget.dart';

class AboutTheUser extends StatefulWidget {
  @override
  _AboutTheUserState createState() => _AboutTheUserState();
}

class _AboutTheUserState extends State<AboutTheUser> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  void inputData() {
    final User _user = auth.currentUser;

    setState(() {
      user = _user;
    });
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
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0.0,
        title: Text(
          "About the User",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 25.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              emailText_widget(user),
              SizedBox(height: 25.0),
              nameText_widget(user),
              editYourUserNameText_widget(),
            ],
          ),
        ),
      ),
    );
  }
}

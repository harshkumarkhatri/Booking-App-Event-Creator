import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheApp/Widgets/aboutTheAppText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheApp/Widgets/appIcon_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheApp/Widgets/versionsText_widget.dart';

class AboutTheAppScreen extends StatefulWidget {
  @override
  _AboutTheAppScreenState createState() => _AboutTheAppScreenState();
}

class _AboutTheAppScreenState extends State<AboutTheAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(
            0.9,
          ),
          iconTheme: IconThemeData(
            color: Colors.orange,
          ),
          centerTitle: true,
          title: Text(
            "About The App",
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 15.0,
              top: 15.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appIcon_widget(),
                  aboutTheAppText_widget(),
                  versionText_widget(),
                ],
              ),
            ),
          ),
        ));
  }
}

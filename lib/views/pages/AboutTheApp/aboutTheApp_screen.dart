import 'package:flutter/material.dart';

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
              left: 16,
              right: 15.0,
              top: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 128,
                    width: 128,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      child: Text(
                        "Eventizer is an app that helps you to create or schedule your events on the go and let people know about the things which you are organizing. This app is the event registering app through which you can add your events, edit your events, change the status of your events, and view the overall stats for your event. Every time a new event is created, users can register for your event.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Container(
                      child: Text(
                        "Version 1.0.0",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/blocs/mainScreen_bloc.dart';
import 'package:flutter_booking_app_event_creator/repositories/logoutUser.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/activeEventTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/addEventButton_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/cancelledEventTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/dateAndTime_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/eventName_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/eventStatusText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/EventItem/locationAndEdit_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/aboutTheUserTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/createNewEventsTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/drawerDivider_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/drawerHeader_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/overAllStatsTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/pastEventTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SettingsScreen/settingScreen_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenBloc mainScreen_bloc = MainScreenBloc();
  String email;
  final _firebaseMessagin = FirebaseMessaging();
  String _message = "message";
  String _token = "generating token";

  @override
  void initState() {
    // TODO: implement initState
    mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
    super.initState();
    _firebaseMessagin.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message ${message}');
      setState(() => _message = "$message");
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume ${message}');
      setState(() => _message = "$message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch ${message}');
      setState(() => _message = "$message");
    });

    _firebaseMessagin.getToken().then((token) {
      print(token);
      setState(() {
        _token = "$token";
      });
    });

    initialzingDemo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mainScreen_bloc.dispose();
    print("disposing");
  }

  // In this we will be initializing a blank data base field for our new user
  void initialzingDemo() async {
    CollectionReference users = Firestore.instance.collection("eventList");

    final FlutterSecureStorage storage = FlutterSecureStorage();
    email = await storage.read(key: "email");
    setState(() {});

    final demoThing =
        await Firestore.instance.collection("eventList").document(email).get();
    if (demoThing.data() == null) {
      users.document(email).set({});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 0,
        title: Text(
          "Eventizer",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            color: Colors.black,
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            drawerHeader(),
            aboutTheUserTile(),
            drawerDivider_widget(),
            createNewEventTile(),
            drawerDivider_widget(),
            ExpansionTile(
              trailing: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.orange,
              ),
              title: Text(
                "Events",
                style: TextStyle(
                  color: Colors.orange,
                ),
              ),
              children: <Widget>[
                drawerDivider_widget(),
                pastEventTile(),
                drawerDivider_widget(),
                activeEventTile(),
                drawerDivider_widget(),
                cancelledEventTile(),
              ],
            ),
            drawerDivider_widget(),
            overAllStateTile(),
            drawerDivider_widget(),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        // child: Container(
        //   child: Center(
        //     child: Column(
        //       children: [
        //         Text(_token),
        //         Divider(),
        //         Text(_message),
        //         RaisedButton(
        //           onPressed: () {
        //             print("Press me is pressed");
        //             sendFcmMessage("Ki haal hai", "Changa fir rab rakha");
        //           },
        //           child: Text("Press me"),
        //         )
        //       ],
        //     ),
        //   ),
        // )

        child: Column(
          children: [
            addEventButton(),
            StreamBuilder(
              stream: mainScreen_bloc.mainScreenStream,
              builder: (context, snapshot) {
                mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
                if (snapshot.hasError) {
                  return Container(
                    child: Text(
                      snapshot.error.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                if (snapshot.hasData) {
                  if (snapshot.data.keys.length == 0) {
                    return Container(child: Text("Add your first event"));
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.keys.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15.0, top: 4, bottom: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(
                                    0.9,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    14,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      eventName_widget(snapshot, index, email),
                                      dateAndTime_widget(
                                          snapshot, index, email),
                                      locationAndEdit_widget(
                                          snapshot, index, email),
                                      eventStatusText_widget(
                                          snapshot, index, email),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        loggingOut();
        break;
      case 'Settings':
        Get.to(SettingScreen());
        break;
    }
  }

  // static Future<bool> sendFcmMessage(String title, String message) async {
  //   print("Inside fcm");
  //   try {
  //     print("Inside try");
  //     var url = 'https://fcm.googleapis.com/fcm/send';
  //     var header = {
  //       "Content-Type": "application/json",
  //       "Authorization":
  //           "key=AAAAZR1NjDc:APA91bEWKQ76JNXFL5nxgzFFNHaP7AJtYD3FuCoFthguHjyoN663mYOx7wgrwf5PmCy5z4pTJ5HLabPe29NeudrTzAzaJ4TGV0u9-7whqPNjEM2TVBEry3teoPqzQIc4pYPgpYu-Iaym",
  //     };
  //     var request = {
  //       "notification": {
  //         "title": title,
  //         "text": message,
  //         "sound": "default",
  //         "color": "#990000",
  //       },
  //       "priority": "high",
  //       "to": "/topics/eventCreators",
  //     };

  //     var client = new Client();
  //     var response =
  //         await client.post(url, headers: header, body: json.encode(request));
  //     print("response is ${response.body}");
  //     return true;
  //   } catch (e, s) {
  //     print("inside error");
  //     print(e);
  //     return false;
  //   }
  // }
}

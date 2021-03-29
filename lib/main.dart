import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/subToTopic_fcm.dart';
import 'package:flutter_booking_app_event_creator/responses/checkConnection.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginSignUpScreen/loginSignup_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/mainScreen_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/NoInternetConnection/noInternetConnection_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FlutterSecureStorage storage = FlutterSecureStorage();
  String email = await storage.read(key: "email");
  String uid = await storage.read(key: "uid");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(email));
}

class MyApp extends StatefulWidget {
  MyApp(String this.email);
  String email;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String connection = null;

  @override
  void initState() {
    super.initState();
    checkConn().then((value) {
      setState(() {
        connection = value;
      });
    });
    subToTopic_fcm();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Eventizer',
        theme: ThemeData(
          canvasColor: Colors.black,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: connection == null
            ? CircularProgressIndicator()
            : connection == "none"
                ? NoInternetConnectionScreen()
                : widget.email == null
                    ? LoginSignUpScreen()
                    : MainScreen());
  }
}

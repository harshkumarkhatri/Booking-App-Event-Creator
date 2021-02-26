import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/HelpAndSupport/Widgets/helpAndSupport_body_widget.dart';

class HelpAndSupportScreen extends StatefulWidget {
  @override
  _HelpAndSupportScreenState createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
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
          "Help & Support",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: helpAndSupport_body_widget(context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/EventDetails_screen/Widgets/dividerEventDetail_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/EventDetails_screen/Widgets/editEventText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/EventDetails_screen/Widgets/itemTextEventDetails_widgets.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreen({this.data});
  Map<String, dynamic> data;

  @override
  _EventDetailsScreenState createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.data["eventName"].toString().toUpperCase(),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 8.0,
            ),
            child: Column(
              children: [
                itemTextEventDetails_widget(
                  "User Name",
                  widget.data['fullUserName'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Contact Email",
                  widget.data['contactEmail'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Phone Number",
                  widget.data['phoneNumber'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Location",
                  widget.data['eventState'] + ", " + widget.data['eventCity'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Event Type",
                  widget.data['eventType'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Expected Audience",
                  widget.data['expectedAudience'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Timing",
                  widget.data['time'],
                ),
                dividerEventDetail(),
                itemTextEventDetails_widget(
                  "Date (yyyy-mm-dd)",
                  widget.data['date'],
                ),
                dividerEventDetail(),
                editEventText_widget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

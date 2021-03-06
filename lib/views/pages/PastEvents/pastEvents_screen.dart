import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/activeListItem_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/noActiveOrCancelledItem_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/noEventsExists.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PastEventsScreen extends StatefulWidget {
  @override
  _PastEventsScreenState createState() => _PastEventsScreenState();
}

class _PastEventsScreenState extends State<PastEventsScreen> {
  int itemLength = 0;
  DocumentSnapshot demoThing;
  bool noEventFound = false;
  bool noPastEventFound = false;
  FieldPath field;

  @override
  void initState() {
    super.initState();
    initialzingDemo();
  }

  void initialzingDemo() async {
    CollectionReference users = Firestore.instance.collection("eventList");

    final FlutterSecureStorage storage = FlutterSecureStorage();
    String email = await storage.read(key: "email");
    final demo =
        await Firestore.instance.collection("eventList").document(email).get();

    field = FieldPath.fromString(email);

    setState(() {
      itemLength = demo.data().keys.length;
      demoThing = demo;
      noEventFound = true;
    });

    if (demoThing != null) {
      if (demoThing.data() == null) {
        users.document(email).set({});
      } else {
        for (int i = 1; i <= demoThing.data().keys.length; i++) {
          if (demoThing.data()['${i}_${field.hashCode}']["eventStatus"] ==
              "expired") {
            setState(() {
              noPastEventFound = false;
            });
            break;
          } else {
            setState(() {
              noPastEventFound = true;
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        title: Text(
          "Past Events",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: itemLength == 0
          ? noEventFound
              ? noActiveOrCancelleditem_widget(
                  "You don't have any past event.\nYour past events will be shown here.")
              : Center(child: CircularProgressIndicator())
          : noPastEventFound
              ? noEventsExists(context, "No past events exisits")
              : Container(
                  decoration: BoxDecoration(color: Colors.orange),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: itemLength,
                    itemBuilder: (context, index) {
                      if (demoThing.data()["${index + 1}_${field.hashCode}"]
                              ["eventStatus"] ==
                          "expired")
                        return activeListItem_widget(demoThing, index, field);
                      else {
                        return Container();
                      }
                    },
                  ),
                ),
    );
  }
}

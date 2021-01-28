import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/activeListItem_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/noActiveOrCancelledItem_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ActiveEvents/Widgets/noEventsExists.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CancelledEventsScreen extends StatefulWidget {
  @override
  _CancelledEventsScreenState createState() => _CancelledEventsScreenState();
}

class _CancelledEventsScreenState extends State<CancelledEventsScreen> {
  int itemLength = 0;
  DocumentSnapshot demoThing;
  bool noEventFound = false;
  bool noCancelledEventFound = false;
  FieldPath field;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialzingDemo();
  }

  void initialzingDemo() async {
    CollectionReference users = Firestore.instance.collection("eventList");

    final FlutterSecureStorage storage = FlutterSecureStorage();
    String email = await storage.read(key: "email");
    final demo =
        await Firestore.instance.collection("eventList").document(email).get();

    print("Demothing");
    field = FieldPath.fromString(email);

    // print(demoThing.data().keys);
    setState(() {
      itemLength = demo.data().keys.length;
      demoThing = demo;
      noEventFound = true;
    });
    print(field.hashCode);
    print(demoThing.data()['1_${field.hashCode}']["eventStatus"]);

    if (demoThing != null) {
      print("demo thing is not null");
      if (demoThing.data() == null) {
        print("dem thing data is null");
        users.document(email).set({});
      } else {
        print("demo thing data is not null");
        for (int i = 1; i <= demoThing.data().keys.length; i++) {
          print(i);
          print(demoThing.data()['${i}_${field.hashCode}']["eventStatus"]);
          if (demoThing.data()['${i}_${field.hashCode}']["eventStatus"] ==
              "cancelled") {
            setState(() {
              noCancelledEventFound = false;
            });
            break;
          } else {
            setState(() {
              noCancelledEventFound = true;
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
          "Cancelled Events",
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
                  "You don't have any cancelled event.\nYour cancelled events will be shown here.")
              : Center(child: CircularProgressIndicator())
          : noCancelledEventFound
              ? noEventsExists(context, "No cancelled events exisits")
              :
              // Container(color: Colors.red, child: Text("Hello")),
              Container(
                  decoration: BoxDecoration(color: Colors.orange),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: itemLength,
                    itemBuilder: (context, index) {
                      if (demoThing.data()["${index + 1}_${field.hashCode}"]
                              ["eventStatus"] ==
                          "cancelled")
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

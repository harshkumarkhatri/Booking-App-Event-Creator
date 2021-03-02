import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OverallStats extends StatefulWidget {
  @override
  _OverallStatsState createState() => _OverallStatsState();
}

class _OverallStatsState extends State<OverallStats> {
  int activeEvents = 0, cancelledEvents = 0, usersRegistered = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializingDemo();
  }

  void initializingDemo() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();

    String email = await storage.read(key: "email");
    FieldPath field = FieldPath.fromString(email);
    final demoThing =
        await Firestore.instance.collection("eventList").document(email).get();
    print(demoThing.data().keys.length);
    for (int i = 0; i < demoThing.data().keys.length; i++) {
      if (demoThing.data()["${i + 1}_${field.hashCode}"]['eventStatus'] ==
          'active') {
        activeEvents++;
      } else if (demoThing.data()["${i + 1}_${field.hashCode}"]
              ['eventStatus'] ==
          'cancelled') {
        cancelledEvents++;
      }
      usersRegistered += demoThing
          .data()["${i + 1}_${field.hashCode}"]['registeredUsers']
          .length;
      setState(() {});
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
          "Overall Stats",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Total Active Events",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "$activeEvents",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Total Cancelled Events",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "$cancelledEvents",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Total users registered",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "$usersRegistered",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700                       ,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

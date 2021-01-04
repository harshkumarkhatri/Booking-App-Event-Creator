import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/blocs/mainScreen_bloc.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/addEvents_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/aboutTheUserTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/createNewEventsTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/drawerHeader_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/overAllStatsTile_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/MainScreen/Widgets/pastEventTile_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

// TODO: Add dispose for block

class _MainScreenState extends State<MainScreen> {
  final mainScreen_bloc = MainScreenBloc();
  @override
  void initState() {
    // TODO: implement initState
    mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
    super.initState();
    getData();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  var jey;

  void inputData() {
    final User _user = auth.currentUser;
    // final uid = user.uid;
    // here you write the codes to input the data into firestore

    setState(() {
      user = _user;
    });
  }

  // dynamic data;
  DocumentSnapshot data;

  Future<dynamic> getData() async {
    inputData();

    // final DocumentReference document =
    final _data = await Firestore.instance
        .collection("eventList")
        .document(user.uid)
        .get();
    final demoThing = await Firestore.instance
        .collection("eventList")
        .document(user.uid)
        .get()
        .then((value) {
      setState(() {
        jey = value.data().values;
      });
      for (var jey in value.data().values) {
        print("printing inside getData ${jey["fullUserName"]}");
      }
    });
    // print(value.data()["5"].length)
    // .getDocuments()
    // .then((value) => print(value.size));
    //  document(user.uid);

    // await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
    //   setState(() {
    //     data = snapshot.data;
    //   });
    // });
    // setState(() {
    //   data = _data;
    // });

    // print("Data is ${_data['5']['fullUserName'].toString()}");
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
          "Main Screen",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
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
            createNewEventTile(),
            pastEventTile(),
            overAllStateTile(),
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Get.to(AddEvents());
              },
              child: Text("Add event"),
            ),
            // Text("Evet added by")
            StreamBuilder(
                stream: mainScreen_bloc.mainScreenStream,
                builder: (context, snapshot) {
                  mainScreen_bloc.eventSink.add(MainScreenActions.Fetch);
                  if (snapshot.hasError) {
                    print("Inside has error");
                    return Container(
                        child: Text(
                      snapshot.error.toString(),
                    ));
                  }
                  if (snapshot.hasData) {
                    // print("Inside has data");
                    print("length inside if ${snapshot.data.keys.length}");
                    // return Text(snapshot.data.toString());
                    return Expanded(
                      // height: 400,
                      child: ListView.builder(
                          itemCount: snapshot.data.keys.length,
                          itemBuilder: (context, index) {
                            // print(index);
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
                                      Container(
                                        child: Text(
                                          index.toString(),
                                          // country['eventName'].toString(),
                                          // snapshot.data[index + 1]['eventName']
                                          //     .toString(),
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.calendar_today,
                                                color: Colors.orange),
                                            Container(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text(
                                                "ss",
                                                // snapshot.data[index + 1]['date']
                                                //     .toString(),
                                                // country['date'].toString(),
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: Text(
                                                "ded"
                                                // country['time'].toString(),
                                                // snapshot.data[index + 1]['time']
                                                // .toString(),
                                                ,
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.lock_clock,
                                              color: Colors.orange,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on,
                                                color: Colors.orange),
                                            Container(
                                              padding: EdgeInsets.only(left: 8),
                                              child: Text(
                                                "ss",
                                                // "${country['eventCity']}, ${country['eventState']}",
                                                style: TextStyle(
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.edit,
                                              color: Colors.orange,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Expanded(child: Text("${country}")),
                                // Text(country['date'].toString()),
                                // Text(country['eventCity'].toString())
                              ),
                            );
                            // Text(
                            //   index.toString(),
                            // );
                          }),
                    );
                    Container(
                      child: Text(snapshot.data.toString()),
                    );
                  }
                  return Container(
                    child: Text(
                      "this is a demo text",
                    ),
                  );
                })
            // if (jey == null)
            //   CircularProgressIndicator()
            // else
            //   for (var country in jey)
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: 15, right: 15.0, top: 4, bottom: 4),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.black.withOpacity(
            //         0.9,
            //       ),
            //       borderRadius: BorderRadius.circular(
            //         14,
            //       ),
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: [
            //           Container(
            //             child: Text(
            //               country['eventName'].toString(),
            //               style: TextStyle(
            //                 color: Colors.orange,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w700,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Icon(Icons.calendar_today,
            //                     color: Colors.orange),
            //                 Container(
            //                   padding: EdgeInsets.only(left: 8),
            //                   child: Text(
            //                     country['date'].toString(),
            //                     style: TextStyle(
            //                       color: Colors.orange,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   ),
            //                 ),
            //                 Spacer(),
            //                 Container(
            //                   padding: EdgeInsets.only(right: 8),
            //                   child: Text(
            //                     country['time'].toString(),
            //                     style: TextStyle(
            //                       color: Colors.orange,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   ),
            //                 ),
            //                 Icon(
            //                   Icons.lock_clock,
            //                   color: Colors.orange,
            //                 ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 4.0),
            //             child: Row(
            //               children: [
            //                 Icon(Icons.location_on, color: Colors.orange),
            //                 Container(
            //                   padding: EdgeInsets.only(left: 8),
            //                   child: Text(
            //                     "${country['eventCity']}, ${country['eventState']}",
            //                     style: TextStyle(
            //                       color: Colors.orange,
            //                       fontWeight: FontWeight.w600,
            //                     ),
            //                   ),
            //                 ),
            //                 Spacer(),
            //                 Icon(
            //                   Icons.edit,
            //                   color: Colors.orange,
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     // Expanded(child: Text("${country}")),
            //     // Text(country['date'].toString()),
            //     // Text(country['eventCity'].toString())
            //   ),
            // )
            // Text("New ${country} \n")
          ],
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        print("Clicked on logout");
        break;
      case 'Settings':
        print("Clicked on Settings");
        break;
    }
  }
}

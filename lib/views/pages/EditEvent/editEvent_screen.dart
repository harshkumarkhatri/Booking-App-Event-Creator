import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/numericCheck.dart';
import 'package:flutter_booking_app_event_creator/responses/updateEventDataToFireStore.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';
import 'package:flutter_booking_app_event_creator/utils/impData.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/chooseText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/textForField_inputDecoration.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditEvent/Widgets/itemText_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class EditEventScreen extends StatefulWidget {
  EditEventScreen({int this.index});
  int index;

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now().add(
    Duration(days: 6),
  );

  TimeOfDay selectedTime = TimeOfDay.now();

  String email,
      eventName,
      fullUserName,
      contactEmail,
      phoneNumber,
      eventState,
      eventCity,
      eventType,
      expectedAudience,
      eventStatus,
      eventURL,
      date = "No Date Selected",
      time = "No Time Selected",
      dropdownValue = 'Andhra Pradesh',
      dropdownValue2 = 'Speaker Session';
  List registeredUsers;

  bool isSwitched = false;
  bool isEditable = true;

  Map userData;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    email = await storage.read(key: "email");

    var firestoreInstance = Firestore.instance;
    FieldPath field = FieldPath.fromString(email);

    firestoreInstance
        .collection("eventList")
        .document(email)
        .get()
        .then((value) {
      print(value.data()["${widget.index}_${field.hashCode}"]["date"]);
      setState(() {
        userData = value.data()["${widget.index}_${field.hashCode}"];
        dropdownValue = userData['eventState'];
        date = userData['date'];
        time = userData['time'];
        dropdownValue2 = userData['eventType'];
        fullUserName = userData['fullUserName'];
        eventState = userData['eventState'];
        eventCity = userData['eventCity'];
        contactEmail = userData['contactEmail'];
        phoneNumber = userData['phoneNumber'];
        eventType = userData['eventType'];
        eventName = userData['eventName'];
        expectedAudience = userData['expectedAudience'];
        eventStatus = userData['eventStatus'];
        eventURL = userData['eventURL'];
        registeredUsers = userData['registeredUsers'];
        selectedDate = DateTime.parse(date);
        var df = DateFormat("h:mma");
        DateTime dt = df.parse(userData['time'].replaceAll(" ", ""));
        selectedTime = TimeOfDay.fromDateTime(dt);

        print(userData['time']);

        print("Selected tiume");
        print(selectedTime);
        userData['eventStatus'] == "active"
            ? isSwitched = true
            : isSwitched = false;
      });
      print(userData['date']);
      DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(userData['date']);
      print("temp date");
      print(tempDate);
      if (DateTime.now().add(Duration(days: 6)).isAfter(tempDate) ||
          userData['eventStatus'] != 'active') {
        isEditable = false;
      }
    });
  }

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
          "Edit Event",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.orange),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: userData == null
                    ? Center(child: CircularProgressIndicator())
                    : isEditable == false
                        ? Container(
                            child: Text(
                              "Sorry this event is not editable as it has either expired or cancelled or occuring in next 6 days.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Column(
                            children: [
                              TextFormField(
                                initialValue: userData['eventName'],
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                decoration: textFormField_inputDecoration(
                                    "Event Name", null),
                                onChanged: (value) {
                                  setState(() {
                                    eventName = value;
                                    print(value);
                                  });
                                },
                                validator: (value) {
                                  if (value.isEmpty || value.length < 4) {
                                    return 'Event Name cannot be less than 4 characters.';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                initialValue: userData['fullUserName'],
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.black),
                                decoration: textFormField_inputDecoration(
                                    "Organizer's Full Name", null),
                                onChanged: (value) {
                                  setState(() {
                                    fullUserName = value;
                                    print(value);
                                  });
                                },
                                validator: (value) {
                                  final validCharacters =
                                      RegExp(r'^[a-zA-Z ]*$');
                                  if (validCharacters.hasMatch(value)) {
                                    if (value.isEmpty || value.length < 4) {
                                      return 'Full name cannot be less than 4 characters.';
                                    }
                                  } else {
                                    return "Organizer's name cannot contain  numberic values or special characters.";
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  initialValue: userData['contactEmail'],
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration: textFormField_inputDecoration(
                                      "Contact Email", null),
                                  onChanged: (value) {
                                    setState(() {
                                      contactEmail = value;
                                      print(value);
                                    });
                                  },
                                  validator: (value) {
                                    bool emailValid = RegExp(
                                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                        .hasMatch(value);
                                    if (value.isEmpty ||
                                        value.length < 4 ||
                                        !emailValid) {
                                      return 'Not a valid email id.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  initialValue: userData['phoneNumber'],
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.black,
                                  decoration: textFormField_inputDecoration(
                                      "Phone number (with country code)",
                                      "Numbers won't be shown to people registering for the event"),
                                  onChanged: (value) {
                                    setState(() {
                                      phoneNumber = value;
                                      print(value);
                                    });
                                  },
                                  validator: (value) {
                                    String patttern =
                                        r'(^(?:[+0]9)?[0-9]{11}$)';
                                    RegExp regExp = new RegExp(patttern);
                                    if (value.length == 0) {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              chooseText("Choose State"),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.orange),
                                    child: DropdownButton<String>(
                                      focusColor: Colors.red,
                                      value: dropdownValue,
                                      icon: Icon(Icons.arrow_downward,
                                          color: Colors.black),
                                      iconSize: 24.0,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                      underline: Container(
                                        height: 2.0,
                                        color: Colors.black,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                          eventState = newValue;
                                        });
                                      },
                                      items: Constants.stateList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: TextFormField(
                                  initialValue: userData['eventCity'],
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration: textFormField_inputDecoration(
                                      "Event City", null),
                                  onChanged: (value) {
                                    setState(() {
                                      eventCity = value;
                                    });
                                  },
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 2) {
                                      return 'City name should be more than 2 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              chooseText("Choose Event Type"),
                              Padding(
                                padding: const EdgeInsets.only(top: 0.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Theme(
                                    data: ThemeData(canvasColor: Colors.orange),
                                    child: DropdownButton<String>(
                                      focusColor: Colors.black,
                                      value: dropdownValue2,
                                      icon: Icon(Icons.arrow_downward,
                                          color: Colors.black),
                                      iconSize: 24.0,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.black),
                                      underline: Container(
                                        height: 2.0,
                                        color: Colors.black,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue;
                                          eventType = newValue;
                                        });
                                      },
                                      items: Constants.eventTypes
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                  bottom: 12.0,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  initialValue: userData['expectedAudience'],
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration: textFormField_inputDecoration(
                                      "Expected audience", null),
                                  onChanged: (value) {
                                    print(value.runtimeType);
                                    setState(() {
                                      expectedAudience = value;
                                      print(value);
                                    });
                                  },
                                  validator: (value) {
                                    if (isNumeric(value) == true) {
                                      return null;
                                    } else {
                                      return 'Please wnter a valid number';
                                    }
                                  },
                                ),
                              ),
                              itemText("Date (yyyy-mm-dd)"),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          date,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Icon(Icons.calendar_today_outlined,
                                            color: Colors.black),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemText("Time"),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 12.0,
                                ),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          time,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.watch_later,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              itemText("Event Status"),
                              Row(
                                children: [
                                  Text(
                                    isSwitched == true ? "Active" : "Cancelled",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Spacer(),
                                  Switch(
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          isSwitched = value;
                                          print(isSwitched);
                                          isSwitched == true
                                              ? eventStatus = "active"
                                              : eventStatus = "cancelled";
                                        },
                                      );
                                    },
                                    activeTrackColor:
                                        Colors.black.withOpacity(0.7),
                                    activeColor: Colors.black,
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "You won't be able to edit the event once it is cancelled",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 25.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    print("event status $eventStatus");
                                    List cancelledEmails = [];
                                    if (eventStatus != 'active') {
                                      String api_link =
                                          "https://e81va8lp88.execute-api.ap-south-1.amazonaws.com/1/sendEmailSingleID/posting";
                                      print(registeredUsers);
                                      for (int i = 0;
                                          i < registeredUsers.length;
                                          i++) {
                                        cancelledEmails
                                            .add(registeredUsers[i]['email']);
                                      }
                                      print("you canceled an event");
                                      http
                                          .post(api_link,
                                              body: jsonEncode({
                                                "value1": "This is value 1",
                                                "cancelledEmails":
                                                    cancelledEmails
                                              }))
                                          .then((value) => print(value.body));
                                    } else {
                                      String api_link =
                                          impData().sendUpdateAboutEventUpdated;
                                      print(registeredUsers);
                                      for (int i = 0;
                                          i < registeredUsers.length;
                                          i++) {
                                        cancelledEmails
                                            .add(registeredUsers[i]['email']);
                                      }
                                      print("you updated an event");

                                      // These values i have kept same so that i don't need to create the same variable again.
                                      // Currently this api will only send a demo text to the mails in the cancelledEmails list
                                      http
                                          .post(api_link,
                                              body: jsonEncode({
                                                "value1": "This is value 1",
                                                "cancelledEmails":
                                                    cancelledEmails
                                              }))
                                          .then((value) => print(value.body));
                                    }
                                    if (_formKey.currentState.validate()) {
                                      print("Form is valid");
                                      updateEventDataToFireStore(
                                          email,
                                          fullUserName,
                                          contactEmail,
                                          phoneNumber,
                                          eventCity,
                                          eventState,
                                          eventType,
                                          expectedAudience,
                                          date,
                                          time,
                                          eventName,
                                          eventStatus,
                                          eventURL,
                                          registeredUsers,
                                          widget.index);

                                      print(
                                          "Adding data directly to firestore");
                                    } else {
                                      print("form is not valid");
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.6),
                                          Colors.black.withOpacity(0.7),
                                          Colors.black.withOpacity(0.8),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.6,
                                          color: Colors.orange.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
              ),
            ),
          )),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    print("inside select date");
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().add(
          Duration(
            days: 6,
          ),
        ),
        lastDate: DateTime.now().add(Duration(days: 180)));
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
        date = pickedDate.toLocal().toString().split(' ')[0];
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime);
    print(pickedTime);
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        time = pickedTime.format(context).toString();
        selectedTime = pickedTime;
      });
    }
  }
}

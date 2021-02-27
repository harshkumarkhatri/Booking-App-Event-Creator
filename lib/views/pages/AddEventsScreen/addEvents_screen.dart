import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/numericCheck.dart';
import 'package:flutter_booking_app_event_creator/responses/addDataToFireStore.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/chooseText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/linkAreNotEditableText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/textForField_inputDecoration.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AddEvents extends StatefulWidget {
  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now().add(
    Duration(days: 6),
  );

  TimeOfDay selectedTime = TimeOfDay.now();

  var firestoreInstance = Firestore.instance;
  String uid,
      eventName,
      fullUserName,
      contactEmail,
      phoneNumber,
      eventState = 'Andhra Pradesh',
      eventCity,
      eventType = 'Speaker Session',
      expectedAudience,
      date = "No Date Selected",
      time = "No Time Selected",
      loginEmail,
      eventURL;

  String dropdownValue = 'Andhra Pradesh';
  String dropdownValue2 = 'Speaker Session';

  bool valuefirst = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    final FlutterSecureStorage storage = FlutterSecureStorage();
    uid = await storage.read(key: "uid");
    firestoreInstance
        .collection("eventList")
        .document(uid)
        .get()
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text(
          "Add Event",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
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
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration:
                        textFormField_inputDecoration("Event Name", null),
                    onChanged: (value) {
                      setState(() {
                        eventName = value;
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
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: textFormField_inputDecoration(
                        "Organizer's Full Name", null),
                    onChanged: (value) {
                      setState(() {
                        fullUserName = value;
                      });
                    },
                    validator: (value) {
                      final validCharacters = RegExp(r'^[a-zA-Z ]*$');
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
                  this.valuefirst == true
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide()),
                            ),
                            child: Text(
                              contactEmail,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            enabled: !this.valuefirst,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: textFormField_inputDecoration(
                                "Contact Email", null),
                            onChanged: (value) {
                              setState(() {
                                contactEmail = value;
                              });
                            },
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                  .hasMatch(value);
                              if (!this.valuefirst) if (value.isEmpty ||
                                  value.length < 4 ||
                                  !emailValid) {
                                return 'Not a valid email id.';
                              }
                              return null;
                            },
                          ),
                        ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Same as account email",
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.greenAccent,
                        activeColor: Colors.red,
                        value: this.valuefirst,
                        onChanged: (bool value) async {
                          FlutterSecureStorage storage = FlutterSecureStorage();
                          String email = await storage.read(key: "email");

                          setState(() {
                            if (value == true) {
                              contactEmail = email;
                            }

                            this.valuefirst = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      decoration: textFormField_inputDecoration(
                          "Phone number (with country code)",
                          "Numbers won't be shown to people registering for the event"),
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                      validator: (value) {
                        String patttern = r'(^(?:[+0]9)?[0-9]{11}$)';
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
                  chooseText("Chosse state"),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Theme(
                        data: ThemeData(canvasColor: Colors.orange),
                        child: DropdownButton<String>(
                          focusColor: Colors.red,
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward, color: Colors.black),
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
                              .map<DropdownMenuItem<String>>((String value) {
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
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration:
                          textFormField_inputDecoration("Event City", null),
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
                          icon: Icon(Icons.arrow_downward, color: Colors.black),
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
                              .map<DropdownMenuItem<String>>((String value) {
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
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration: textFormField_inputDecoration(
                          "Expected audience", null),
                      onChanged: (value) {
                        setState(() {
                          expectedAudience = value;
                        });
                      },
                      validator: (value) {
                        if (isNumeric(value) == true) {
                          return null;
                        } else {
                          return 'Please enter a valid number';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      keyboardType: TextInputType.url,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      decoration:
                          textFormField_inputDecoration("Event Link", null),
                      onChanged: (value) {
                        setState(() {
                          eventURL = value;
                        });
                      },
                      validator: (value) {
                        if (value.length > 7) {
                          if (value.substring(0, 8) == "https://" ||
                              value.substring(0, 7) == "http://") {
                            return null;
                          } else {
                            return 'Please enter a valid url';
                          }
                        } else {
                          return 'Event link cannot be less than 7 characters';
                        }
                      },
                    ),
                  ),
                  linkAreNotEditablet_widget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                      child: Text(
                          "Event can be be editted if it has 7 days remaining")),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        _selectTime(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              time,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Icon(Icons.watch_later, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 25),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate() &&
                            date != "No Date Selected" &&
                            time != "No Time Selected") {
                          addingDataToFireStore(
                              uid,
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
                              eventURL);
                        } else if (date == "No Date Selected") {
                          Get.snackbar(
                              "No Date Selected", "Please select a date",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.orange,
                              backgroundColor: Colors.black);
                        } else if (time == "No Time Selected") {
                          Get.snackbar(
                              "No Time Selected", "Please select a Time",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.orange,
                              backgroundColor: Colors.black);
                        } else {}
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
                              fontSize: 32,
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
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
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
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        time = pickedTime.format(context).toString();
        selectedTime = pickedTime;
      });
    }
  }
}

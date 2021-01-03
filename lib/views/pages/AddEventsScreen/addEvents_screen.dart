import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/responses/addDataToFireStore.dart';
import 'package:flutter_booking_app_event_creator/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      eventState,
      eventCity,
      eventType,
      expectedAudience,
      date = "No Date Selected",
      time = "No Time Selected";
  SharedPreferences prefs;

  String dropdownValue = 'Andhra Pradesh';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("uid");
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
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add Event", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          // TODO:ADD 3 dots here.
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15.0),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: "Event Name",
                      labelStyle: TextStyle(color: Colors.red),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // email = value;
                        eventName = value;
                        print(value);
                      });
                    },
                    validator: (value) {
                      // bool emailValid = RegExp(
                      //         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                      //     .hasMatch(value);
                      // print(emailValid);
                      if (value.isEmpty || value.length < 4) {
                        return 'Event Name cannot be less than 4 characters.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      labelText: "Organizer's Full Name",
                      labelStyle: TextStyle(color: Colors.red),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onChanged: (value) {
                      setState(() {
                        // email = value;
                        fullUserName = value;
                        print(value);
                      });
                    },
                    validator: (value) {
                      // bool emailValid = RegExp(
                      //         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                      //     .hasMatch(value);
                      // print(emailValid);
                      if (value.isEmpty || value.length < 4) {
                        return 'Full name cannot be less than 4 characters.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: "Contact Email",
                        labelStyle: TextStyle(color: Colors.red),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // email = value;
                          contactEmail = value;
                          print(value);
                        });
                      },
                      validator: (value) {
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(value);
                        // print(emailValid);
                        if (value.isEmpty || value.length < 4 || !emailValid) {
                          return 'Not a valid email id.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        helperText:
                            "Number won't be shown to people registring for the event.",
                        // hintText:
                        //     "Number won't be shown to people registring for the event.",
                        labelText: "Phone number (with country code)",
                        labelStyle: TextStyle(color: Colors.red),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // email = value;
                          phoneNumber = value;
                          print(value);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 6),
                      child: Text(
                        "Chosse state",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_downward, color: Colors.red),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.red),
                        underline: Container(
                          height: 2,
                          color: Colors.red,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        // hintText:
                        //     "Number won't be shown to people registring for the event.",
                        labelText: "Event City",
                        labelStyle: TextStyle(color: Colors.red),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // email = value;
                          eventCity = value;
                          // print(value);
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

                  // TODO: Convert this to match the event type option on bookmy show website
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        // helperText:
                        //     "Number won't be shown to people registring for the event.",
                        // hintText:
                        //     "Number won't be shown to people registring for the event.",
                        labelText: "Event Type",
                        labelStyle: TextStyle(color: Colors.red),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        setState(() {
                          // email = value;
                          eventType = value;
                          // print(value);
                        });
                      },
                      validator: (value) {
                        // bool emailValid = RegExp(
                        //         r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        //     .hasMatch(value);
                        // // print(emailValid);
                        // if (value.isEmpty || value.length < 4 || !emailValid) {
                        //   return 'Please enter some text';
                        // }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        // helperText:
                        //     "Number won't be shown to people registring for the event.",
                        // hintText:
                        //     "Number won't be shown to people registring for the event.",
                        labelText: "Expected audience",
                        labelStyle: TextStyle(color: Colors.red),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onChanged: (value) {
                        print(value.runtimeType);
                        setState(() {
                          // email = value;
                          expectedAudience = value;
                          print(value);
                        });
                      },
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return 'Please enter expected audience';
                        // }
                        // return null;

                        // String patttern = r'([0-9])';
                        // RegExp regExp = new RegExp(patttern);
                        // if (value.length == 0) {
                        //   return 'Please enter mobile number';
                        // } else if (!regExp.hasMatch(value)) {
                        //   return 'Please enter valid mobile number';
                        // }
                        // return null;
                        if (_isNumeric(value) == true) {
                          return null;
                        } else {
                          return 'Please wnter a valid number';
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
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
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.calendar_today_outlined,
                                color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: GestureDetector(
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
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.watch_later, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          print("Form is valid");
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
                              eventName);
                        } else {
                          print("form is not valid");
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.red[400],
                              Colors.red,
                              Colors.red[600],
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
                              color: Colors.black,
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

  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
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
    print(pickedTime);
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        time = pickedTime.format(context).toString();
        selectedTime = pickedTime;
      });
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/changeUserDisplayName.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditName/Widgets/editButton_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditName/Widgets/txtField_inputDecoration.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditName/Widgets/userNameText_widget.dart';

class EditNameScreen extends StatefulWidget {
  @override
  _EditNameScreenState createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;
  String userName;
  bool isActive = false;

  void inputData() {
    final User _user = auth.currentUser;

    setState(() {
      user = _user;
    });

    print(user);
    setState(() {
      userName = user.displayName == "" || user.displayName == null
          ? "No display name found"
          : user.displayName;
    });
  }

  @override
  void initState() {
    super.initState();
    inputData();
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
          "Edit Name",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: 15.0,
          ),
          child: Column(
            children: [
              userNameText_widget(userName),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.black,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              userName = value;
                            });
                          },
                          cursorColor: Colors.black,
                          decoration: textField_inputDecoration(),
                        ),
                      ),
                    )
                  : Container(),
              isActive
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 45.0,
                        child: RaisedButton(
                          onPressed: () {
                            changeUserDisplayName(userName);
                            setState(() {
                              isActive == true
                                  ? isActive = false
                                  : isActive = true;
                            });
                          },
                          color: Colors.black,
                          child: Text(
                            "Save New Name",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    isActive == true ? isActive = false : isActive = true;
                  });
                },
                child: editButton_widget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

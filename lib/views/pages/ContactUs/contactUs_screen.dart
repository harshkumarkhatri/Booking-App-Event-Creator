import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/responses/addProblemsToFireStore.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AddEventsScreen/Widgets/textForField_inputDecoration.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ContactUs/Widgets/contactUs_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ContactUs/Widgets/overwrittenText_widget.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name, desc;
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
          "Contact Us",
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
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: textFormField_inputDecoration(
                        "What should we call you?", null),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) {
                      final validCharacters = RegExp(r'^[a-zA-Z ]*$');
                      if (validCharacters.hasMatch(value)) {
                        if (value.isEmpty || value.length < 3) {
                          return "Name cannot be less than 4 characters";
                        }
                      } else {
                        return "Name cannot contain numbers";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    minLines: 4,
                    maxLines: 8,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    decoration: textFormField_inputDecoration(
                        "Describe your problem", null),
                    onChanged: (value) {
                      setState(() {
                        desc = value;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Problem should be more than 5 character";
                      }
                      return null;
                    },
                  ),
                  overwrittenText_widget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          addProblemsToFireStore(name, desc);
                        } else {
                          Get.snackbar("Something wrong",
                              "Hey something is not wrong. Please contact the developer.");
                        }
                      },
                      child: contactUs_widget(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SignUpScreen/Widgets/alreadyAUserText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SignUpScreen/Widgets/loginButton_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SignUpScreen/Widgets/signUpButtonSingUpScreen_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SignUpScreen/Widgets/signUpWithGoogleButton_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, pass, confPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.orange,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                        child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 58),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.6,
                                  fontSize: 40.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black),
                                errorStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                bool emailValid = RegExp(
                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                    .hasMatch(value);
                                if (value.isEmpty ||
                                    value.length < 4 ||
                                    !emailValid) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black),
                                errorStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  pass = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'Password should 6 characters or long';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(color: Colors.black),
                                errorStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  confPass = value;
                                });
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'Password should 6 characters or long';
                                } else if (confPass != pass) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                          ),
                          signUpButtonSignUpScreen(
                              context, _formKey, email, pass),
                          signUpWithGoogleButton(),
                          alreadyAUserText(),
                          loginButtonSignUpScreen()
                        ],
                      ),
                    )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

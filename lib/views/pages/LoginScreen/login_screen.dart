import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/Widgets/loginButton_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/Widgets/loginWithGoogleButton_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/Widgets/newuserText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/LoginScreen/Widgets/signUpButton_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
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
                            padding: const EdgeInsets.only(
                              bottom: 58.0,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.orange,
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
                              cursorColor: Colors.orange,
                              style: TextStyle(color: Colors.orange),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.orange),
                                errorStyle: TextStyle(
                                  color: Colors.orange,
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
                              cursorColor: Colors.orange,
                              obscureText: true,
                              style: TextStyle(color: Colors.orange),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange),
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.orange),
                                errorStyle: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16.0,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
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
                          loginButtonLoginScreen(
                              context, _formKey, email, password),
                          loginWithGoogleButton(),
                          newUserText(),
                          signUpButton()
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

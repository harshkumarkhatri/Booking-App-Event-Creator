import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/AboutTheApp/aboutTheApp_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/ContactUs/contactUs_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/EditName/editName_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/FrequentlyAskedQuestions/frequentlyAskedQuestion_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/HelpAndSupport/helpAndSupport_screen.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SettingsScreen/Widgets/Logout/logout_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SettingsScreen/Widgets/ShareTheApp/shareTheApp_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SettingsScreen/Widgets/demo_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/SettingsScreen/Widgets/divider_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/WhatsNew/whatsNew_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          "Settings",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                demoWidget(
                  Icons.edit,
                  "Edit Name",
                  EditNameScreen(),
                ),
                dividerSettingScreen(),
                demoWidget(
                  Icons.info,
                  "About The App",
                  AboutTheAppScreen(),
                ),
                dividerSettingScreen(),
                demoWidget(
                  Icons.help,
                  "Help & Support",
                  HelpAndSupportScreen(),
                ),
                dividerSettingScreen(),
                demoWidget(
                  Icons.question_answer_outlined,
                  "FAQ's",
                  FrequentlyAskedQuestionsScreen(),
                ),
                dividerSettingScreen(),
                demoWidget(
                  Icons.contact_mail,
                  "Contact Us",
                  ContactUsScreen(),
                ),
                dividerSettingScreen(),
                demoWidget(
                  Icons.new_releases_outlined,
                  "What's New",
                  WhatsNewScreen(),
                ),
                dividerSettingScreen(),
                shareTheApp_widget(
                  Icons.share_outlined,
                  "Share",
                ),
                dividerSettingScreen(),
                logout_widget(
                  Icons.logout,
                  "Logout",
                ),
                dividerSettingScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

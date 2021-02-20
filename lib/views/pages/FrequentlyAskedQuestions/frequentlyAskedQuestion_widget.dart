import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/views/pages/FrequentlyAskedQuestions/Widgets/answerText_widget.dart';
import 'package:flutter_booking_app_event_creator/views/pages/FrequentlyAskedQuestions/Widgets/questionText_widget.dart';

class FrequentlyAskedQuestionsScreen extends StatefulWidget {
  @override
  _FrequentlyAskedQuestionsScreenState createState() =>
      _FrequentlyAskedQuestionsScreenState();
}

class _FrequentlyAskedQuestionsScreenState
    extends State<FrequentlyAskedQuestionsScreen> {
  double _animatedHeight = 100.0;

  bool initial1 = false;
  bool initial2 = false;
  bool initial3 = false;
  bool initial4 = false;
  bool initial5 = false;
  bool initial8 = false;
  bool initial7 = false;
  bool initial6 = false;
  bool initial9 = false;
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
          "FAQ's",
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Card(
                  color: Colors.orange,
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _animatedHeight == 0.0
                                ? _animatedHeight = 100.0
                                : _animatedHeight = 00.0;
                            initial1 == false
                                ? initial1 = true
                                : initial1 = false;
                          });
                        },
                        child: questionText_widget("What is Eventizer?"),
                      ),
                      initial1 == true
                          ? answerText_widget(
                              "It is an app through which you cna schedule your events and let users know about your events. \nUsers can then register for your event.\nIt helps you incerse the reach of your event to a wider audience.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial2 == false
                                  ? initial2 = true
                                  : initial2 = false;
                            });
                          },
                          child: questionText_widget("Why Eventizer?"),
                        ),
                      ),
                      initial2 == true
                          ? answerText_widget(
                              "The main idea behind creating eventizer is to to help communities increase the reach of their events.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial3 == false
                                  ? initial3 = true
                                  : initial3 = false;
                            });
                          },
                          child: questionText_widget(
                              "What all can be done in eventizer?"),
                        ),
                      ),
                      initial3 == true
                          ? answerText_widget(
                              "Eventizer provides you a flexibility to create your events from different categories like speaker sessions, exhibition, info-session, online streaming, workshops, bootcamps etc. \nYou can schedule your events through the add event button on the main screen.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial4 == false
                                  ? initial4 = true
                                  : initial4 = false;
                            });
                          },
                          child: questionText_widget(
                              "What all details will be shared with the users?"),
                        ),
                      ),
                      initial4 == true
                          ? answerText_widget(
                              "Users will be able to see the event name, organizer's name, contact email, state, city, event type, event date & event time for a particular event.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial5 == false
                                  ? initial5 = true
                                  : initial5 = false;
                            });
                          },
                          child: questionText_widget(
                              "Why is my email shared with the users?"),
                        ),
                      ),
                      initial5 == true
                          ? answerText_widget(
                              "Users will be be able to view your event so that they can contact you in case of any issue or if they want some more info regarding an event.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial6 == false
                                  ? initial6 = true
                                  : initial6 = false;
                            });
                          },
                          child: questionText_widget(
                              "Can i schedule an offline events?"),
                        ),
                      ),
                      initial6 == true
                          ? answerText_widget(
                              "For now we are not accepting offline events and as a result of this we are not asking the orgaizer's for full details of event's venue.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial7 == false
                                  ? initial7 = true
                                  : initial7 = false;
                            });
                          },
                          child:
                              questionText_widget("Why can't i edit my event?"),
                        ),
                      ),
                      initial7 == true
                          ? answerText_widget(
                              "Events cannot be edited if they have are cancelled by the user or have 7 days left for their occurance or they have expired(crossed the occurance date). \nIf you have less that 7 days for the event to occur and want your event to be cancelled then mail us at mailharshkhatri@gmail.com.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial8 == false
                                  ? initial8 = true
                                  : initial8 = false;
                            });
                          },
                          child: questionText_widget(
                              "What will happen if an event is cancelled by the organizer?"),
                        ),
                      ),
                      initial8 == true
                          ? answerText_widget(
                              "When an event will be cancelled then an email will be sent to the users who have registered for that event. \nThe organizer won't be able to edit the event again.")
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial9 == false
                                  ? initial9 = true
                                  : initial9 = false;
                            });
                          },
                          child: questionText_widget(
                              "Why can't users register for my events?"),
                        ),
                      ),
                      initial9 == true
                          ? answerText_widget(
                              "Enetizer team has all the rights to edit/delete/update your event.\nIf we find out that your event is suspicious then we will put it on hold or prohibit more users for registering for the event.\nIf you think we have mistaken, you can let us know through the contact us option or help and support option.",
                            )
                          : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

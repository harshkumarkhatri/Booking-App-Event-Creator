import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisteredUsers extends StatefulWidget {
  RegisteredUsers(this.snapshot, int this.index, String this.email);
  dynamic snapshot;
  int index;
  String email;

  @override
  _RegisteredUsersState createState() => _RegisteredUsersState();
}

class _RegisteredUsersState extends State<RegisteredUsers> {
  @override
  Widget build(BuildContext context) {
    FieldPath field = FieldPath.fromString(widget.email);

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.orange,
          ),
          backgroundColor: Colors.black.withOpacity(0.9),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Registered Users",
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
          child:
              widget
                          .snapshot
                          .data["${widget.index + 1}_${field.hashCode}"]
                              ['registeredUsers']
                          .isEmpty ==
                      true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "No user has registered for this particular event.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15.0,
                            top: 4.0,
                            bottom: 4.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(
                                0.9,
                              ),
                              borderRadius: BorderRadius.circular(
                                14.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                8.0,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    widget.snapshot.data[
                                            "${widget.index + 1}_${field.hashCode}"]
                                        ['registeredUsers'][index]['email'],
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          widget.snapshot.data[
                                                          "${widget.index + 1}_${field.hashCode}"]
                                                      ['registeredUsers'][index]
                                                  ['city'] +
                                              " " +
                                              widget.snapshot.data[
                                                          "${widget.index + 1}_${field.hashCode}"]
                                                      ['registeredUsers'][index]
                                                  ['state'],
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: widget
                          .snapshot
                          .data["${widget.index + 1}_${field.hashCode}"]
                              ['registeredUsers']
                          .length,
                    ),
        ));
  }
}

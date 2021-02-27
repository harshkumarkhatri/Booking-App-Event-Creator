import 'package:flutter/material.dart';
import 'package:flutter_booking_app_event_creator/repositories/mailTo_harsh.dart';

Widget helpAndSupport_body_widget(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(color: Colors.orange),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: Column(
        children: [
          Container(
            height: 256.0,
            width: 256.0,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
                "https://res.cloudinary.com/harshkumarkhatri/image/upload/v1611391578/Support-512_suwagi.png"),
          ),
          Text(
            "Want some help or support for your personal event?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.4,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                launchMailto();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Write us at",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.4,
                        height: 1.3,
                      ),
                    ),
                    TextSpan(
                        text: " mailharshkhatri@gmail.com",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.4,
                          height: 1.3,
                        ))
                  ]),
                ),
              )),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Always happy to help you:)",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.4,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

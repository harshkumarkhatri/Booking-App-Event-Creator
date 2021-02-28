// This send a mail to the specified email id. The email will be sent if an event creator needs some extra support for his event.

import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

launchMailto() async {
  final mailtoLink = Mailto(
    to: ['mailharshkhatri@gmai.com'],
    subject: 'Help & Support',
  );

  // This is done with the help of URL launcher
  await launch('$mailtoLink');
}

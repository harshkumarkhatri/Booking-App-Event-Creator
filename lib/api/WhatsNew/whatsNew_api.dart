// Fetches the data related to whats new features are added in the app from the aws api
import 'package:flutter_booking_app_event_creator/utils/impData.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchAlbum() {
  return http.get(impData().whatsNewAPIURL);
}

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/api/api.dart';

class TimeZoneModel {
  String? timeZone, currentLocalTime;
  bool? hasDaylightSaving, isDayLightSavingActive;

  TimeZoneModel(
      {timeZone, currentLocalTime, hasDaylightSaving, isDayLightSavingActive});

  Future<Map<String, dynamic>> getTimeZoneDateTime(
      double lat, double lon) async {
    try {
      String url = '${timeZoneUrl}latitude=${lat}&longitude=${lon}';
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      if (kDebugMode) {
        print(dataMap);
      }
      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return {'x', e} as Map<String, dynamic>;
    }
  }
}

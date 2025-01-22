import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/api/api.dart';

class ForecastModel {
  String? datetime, description, sunrise, sunset, source;
  double? tempmax,
      tempmin,
      cloudcover,
      humidity,
      latitude,
      longitude,
      precipprob,
      uvindex;

  ForecastModel(
      {source,
      datetime,
      description,
      sunrise,
      sunset,
      tempmax,
      tempmin,
      cloudcover,
      precipprob,
      humidity,
      latitude,
      longitude});

  Future<Map<String, dynamic>> getForecast(
      double latitude, double longitude) async {
    try {
      String url =
          '${vcLatLonUrl_1}${latitude},${longitude}${vcLatLonUrl_2}$vcKey';
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return {'x', e} as Map<String, dynamic>;
    }
  }
}

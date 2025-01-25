import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:weather/api/api.dart';

class WeatherModel {
  double? coordLongitude, coordLatitude;
  String? weatherMain, weatherDescription, weatherIcon;
  double? mainTemmp, mainFeelsLike, mainTempMin, mainTempMax;
  int? mainPressure, mainHumidity;
  double? windSpeed, windGust;
  int? windDeg;
  int? sysSunrise, sysSunSet;
  String? sysCountry;
  String? name; // the city name
  int? timezone;
  int? date;
  // the next come from GeoModel
  String? sunrise, sunset;
  // the next come from the TimeZone API and TimeZoneModel
  String? currentLocalTime;
  bool? hasDaylightSaving, isDayLightSavingActive;

  WeatherModel(
      {weatherMain,
      weatherDescription,
      weatherIcon,
      mainTemmp,
      mainFeelsLike,
      mainTempMin,
      mainTempMax,
      mainPressure,
      mainHumidity,
      windSpeed,
      windDeg,
      windGust,
      sysSunrise, // not used
      sysSunSet, // not used
      sysCountry,
      name,
      timezone,
      coordLatitude,
      coordLongitude,
      date,
      // the next come from GeoModel
      sunrise,
      sunset,
      // the next come from the TimeZone API and TimeZoneModel
      currentLocalTime,
      hasDayLightSavingTime,
      isDayLightSavingTimeActive});

  Future<Map<String, dynamic>> getWeatherByZip(String zipCode) async {
    try {
      String url = '${urlPrefix}zip=$zipCode&appid=$appId';
      // if (kDebugMode) {
      //   print(url);
      // }
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

  Future<Map<String, dynamic>> getWeatherByCity(String cityCode) async {
    try {
      String url = '${urlPrefix}q=$cityCode&appid=$appId';
      // if (kDebugMode) {
      //   print(url);
      // }
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

  Future<Map<String, dynamic>> getWeatherByCurrentLoaction(
      double latitude, double longitude) async {
    try {
      String url = '${urlPrefix}lat=$latitude&lon=$longitude&appid=$appId';
      //String url = '$vcLatLonUrl_1$latitude,$longitude$keyForUrl';
      // if (kDebugMode) {
      //   print(url);
      // }
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      // if (kDebugMode) {
      //   print(dataMap);
      // }
      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return {'x', e} as Map<String, dynamic>;
    }
  }
}

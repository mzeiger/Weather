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
  String? sunrise, sunset;

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
      sysSunrise,
      sysSunSet,
      sysCountry,
      name,
      timezone,
      coordLatitude,
      coordLongitude,
      date,
      sunrise,
      sunset});

  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      weatherMain: jsonData['weather'][0]['main'] as String,
      weatherDescription: jsonData['weather'][0]['description'] as String,
      weatherIcon: jsonData['weather'][0]['icon'] as String,
      mainTemmp: jsonData['main']['temp'] as double,
      mainFeelsLike: jsonData['main']['feels_like'] as double,
      mainTempMin: jsonData['main']['temp_min'] as double,
      mainTempMax: jsonData['main']['temp_max'] as double,
      mainPressure: jsonData['main']['pressure'] as int,
      mainHumidity: jsonData['main']['humidity'] as int,
      windSpeed: jsonData['wind']['speed'] as double,
      windDeg: jsonData['wind']['deg'] as int,
      windGust: jsonData['wind']['gust'],
      sysSunrise: jsonData['sys']['sunrise'] as int,
      sysSunSet: jsonData['sys']['sunset'] as int,
      sysCountry: jsonData['sys']['country'] as String,
      name: jsonData['name'] as String,
      timezone: jsonData['timezone'] as int,
      coordLatitude: jsonData['coord']['lat'] as double,
      coordLongitude: jsonData['coord']['lon'] as double,
      date: jsonData['dt'] as int,
    );
  }

  Future<Map<String, dynamic>> getWeatherByZip(String zipCode) async {
    try {
      String url = '${urlPrefix}zip=$zipCode&appid=$appId';
      if (kDebugMode) {
        print(url);
      }
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return {"x", e} as Map<String, dynamic>;
    }
  }

  Future<Map<String, dynamic>> getWeatherByCity(String cityCode) async {
    try {
      String url = '${urlPrefix}q=$cityCode&appid=$appId';
      if (kDebugMode) {
        print(url);
      }
      final response = await http.get(Uri.parse(url));
      Map<String, dynamic> dataMap = jsonDecode(response.body);
      return dataMap;
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
      return {"x", e} as Map<String, dynamic>;
    }
  }

  Future<Map<String, dynamic>> getWeatherByCurrentLoaction(
      double latitude, double longitude) async {
    try {
      String url = '${urlPrefix}lat=$latitude&lon=$longitude&appid=$appId';
      //String url = '$vcLatLonUrl_1$latitude,$longitude$keyForUrl';
      if (kDebugMode) {
        print(url);
      }
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
      return {"x", e} as Map<String, dynamic>;
    }
  }
}

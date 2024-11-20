import 'dart:convert';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

// WeatherModel getWeatherByZipTest(data) {
//   Map<String, dynamic> dataMap = jsonDecode(data);
//   WeatherModel weather = WeatherModel.fromJson(dataMap);
//   return weather;
// }
class WeatherByZipCode {
  final String zipCode;
  WeatherByZipCode({required this.zipCode});

  Future<WeatherModel> getWeatherByZip() async {
    String url = zipUrl + zipCode;
    final response = await http.get(Uri.parse(url));
    Map<String, dynamic> dataMap = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(dataMap);
    return weather;
  }
}

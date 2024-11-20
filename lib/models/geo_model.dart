import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/api/api.dart';

class GeoModel {
  String? name, state, country;

  GeoModel({name, state, country});

  Future<Map<String, dynamic>> getLocationByLatLon(
      double lat, double lon) async {
    try {
      String url =
          "https://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&limit=5&appid=$appId";
      final response = await http.get(Uri.parse((url)));
      List geoData = jsonDecode(response.body);
      Map<String, dynamic> geoInfo = geoData[0];
      return geoInfo;
    } catch (e) {
      return {"x", e} as Map<String, dynamic>;
    }
  }
}

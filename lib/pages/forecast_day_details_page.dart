import 'package:flutter/material.dart';
import 'package:weather/models/forecast_model.dart';

class DayDetailsForForecast extends StatelessWidget {
  const DayDetailsForForecast({super.key, required this.dayForecast
      // required this.lat,
      // required this.lon,
      });

  final ForecastModel dayForecast;
  //final double lat, lon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day Details'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Day details for ${dayForecast.datetime}'),
            Text(
                'Latitude: ${dayForecast.latitude}  -- Longitude: ${dayForecast.longitude}')
          ],
        ),
      ),
    );
  }
}

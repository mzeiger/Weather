import 'package:flutter/material.dart';
import 'package:weather/Widgets/weather_widgets.dart';
import 'package:weather/models/forecast_model.dart';

class DayDetailsForForecast extends StatelessWidget {
  const DayDetailsForForecast(
      {super.key, required this.dayForecasts, required this.date});

  final List<ForecastModel> dayForecasts;
  final String date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(datetimeStringToNewFormat(date)),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: dayForecasts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          timeStringToNewFormat(dayForecasts[index].datetime!),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.purple, fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Temp: ${dayForecasts[index].temp}'),
                          Text('Humidity ${dayForecasts[index].humidity}')
                        ],
                      ),
                      Text('${dayForecasts[index].conditions}')
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/forecast_model.dart';
import 'package:weather/pages/forecast_day_details_page.dart';

class ForecastPage extends StatelessWidget {
  final List<ForecastModel> forecasts;
  final double lat, lon;

  const ForecastPage(
      {super.key,
      required this.forecasts,
      required this.lat,
      required this.lon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecasts'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: forecasts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
                child: GestureDetector(
                  onDoubleTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DayDetailsForForecast(dayForecast: forecasts[index]
                                // lat: lat,
                                // lon: lon,
                                ),
                      ),
                    )
                  },
                  child: Card(
                    elevation: 10,
                    color: Colors.lightBlueAccent,
                    child: Column(
                      children: [
                        Text(
                          datetimeStringToNewFormat(forecasts[index].datetime!),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.purple),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Max Temp: ${forecasts[index].tempmax}'),
                            Text('Min Temp: ${forecasts[index].tempmin}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Sunrise: ${forecasts[index].sunrise}'),
                            Text('Sunset: ${forecasts[index].sunset}'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Humidity: ${forecasts[index].humidity}'),
                            Text('UV Index: ${forecasts[index].uvindex}')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Cloud Cover: ${forecasts[index].cloudcover}'),
                            Text('Precip Prob: ${forecasts[index].precipprob}%')
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Text(
                            '${forecasts[index].description}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  String datetimeStringToNewFormat(String date) {
    DateTime dt = DateTime.parse(date);
    return DateFormat('EEEE MMM d, yyyy').format(dt).toString();
  }
}

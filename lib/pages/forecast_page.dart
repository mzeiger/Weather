import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/forecast_model.dart';

class ForecastPage extends StatelessWidget {
  final List<ForecastModel> forecasts;
  const ForecastPage({super.key, required this.forecasts});

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
                child: Card(
                  elevation: 10,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      Text(
                        //'Date: ${forecasts[index].datetime}',
                        datetimeStringToNewFormat(forecasts[index].datetime!),
                        textAlign: TextAlign.center,
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                        child: Text('${forecasts[index].description}'),
                      ),
                    ],
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

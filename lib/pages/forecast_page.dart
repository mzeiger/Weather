import 'package:flutter/material.dart';
import 'package:weather/Widgets/weather_widgets.dart';
import 'package:weather/models/forecast_model.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daily Forecasts'),
          backgroundColor: Colors.lightBlue,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pexels-pixabay-314726.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: ListView.builder(
                      itemCount: forecasts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 2),
                          child: GestureDetector(
                            onDoubleTap: () => {
                              hourlyForecastsGestureDoubleTap(
                                  context, lat, lon, forecasts[index].datetime!)
                            },
                            child: Card(
                              elevation: 10,
                              color: const Color.fromARGB(123, 64, 195, 255),
                              child: Column(
                                children: [
                                  index == 0
                                      ? const Text(
                                          'Today',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                          ),
                                        )
                                      : const SizedBox(height: 0),
                                  Text(
                                    datetimeStringToNewFormat(
                                        forecasts[index].datetime!),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.purple),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          'Max Temp: ${forecasts[index].tempmax}'),
                                      Text(
                                          'Min Temp: ${forecasts[index].tempmin}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          'Sunrise: ${forecasts[index].sunrise}'),
                                      Text(
                                          'Sunset: ${forecasts[index].sunset}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          'Humidity: ${forecasts[index].humidity}'),
                                      Text(
                                          'UV Index: ${forecasts[index].uvindex}')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          'Cloud Cover: ${forecasts[index].cloudcover}'),
                                      Text(
                                          'Precip Prob: ${forecasts[index].precipprob}%')
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 5),
                                    child: Text(
                                      '${forecasts[index].description}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.amber[50],
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Double-tap on a day to get its hourly forecast',
                        textAlign: TextAlign.center),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

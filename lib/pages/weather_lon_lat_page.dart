import 'package:flutter/material.dart';
import 'package:weather/Widgets/weather_widgets.dart';
import 'package:weather/helpers/state_abreviations.dart';
import 'package:weather/helpers/time_formulars.dart';
import 'package:weather/models/geo_model.dart';
import 'package:weather/models/weather_model.dart';

class WeatherLLPage extends StatelessWidget {
  const WeatherLLPage(
      {required this.geoModel, super.key, required this.weather});

  final GeoModel geoModel;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Weather Details'),
              centerTitle: true,
              backgroundColor: Colors.lightBlue,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  FocusScope.of(context)
                      .unfocus(); // This will dismiss the keyboard.
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(55, 110, 110, 241),
                      Color.fromARGB(120, 13, 13, 77),
                    ]),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5,
                  children: [
                    _location(),
                    imageFromOpenWeather(weather),
                    Text(
                      '${Formulas.getDate(weather)}  ${Formulas.getTime(weather)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    keyInfo(context, weather),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 8,
                      children: [
                        forecastButton(context, weather.coordLatitude!,
                            weather.coordLongitude!),
                        mapboxButton(context, weather.coordLatitude!,
                            weather.coordLongitude!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _location() {
    return Column(
      children: [
        Text('${geoModel.street}', style: textStyle(20)),
        Text(
          '${geoModel.locality}, ${StateAbreviations.getStateAbrevaition(geoModel.administrativeArea!)} ${geoModel.postalCode}',
          style: textStyle(20),
        ),
        Text(
          '${geoModel.country}',
          style: textStyle(20),
        )
      ],
    );
  }
}

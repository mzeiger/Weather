import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather/api/api.dart';
import 'package:weather/helpers/time_formulars.dart';
import 'package:weather/models/weather_model.dart';

Widget imageFromOpenWeather(WeatherModel weather) {
  return Column(
    children: [
      Container(
        color: Colors.lightBlue.withOpacity(0.4),
        child: ClipRect(
          child: Align(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Image.network('${iconUrl + weather.weatherIcon!}@2x.png',
                width: 200, height: 200),
          ),
        ),
      ),
      Text(
        '${weather.weatherDescription}',
        style: textStyle(20),
      ),
    ],
  );
}

Widget keyInfo(WeatherModel weather) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Temperature: ${weather.mainTemmp}°F',
              style: TextStyle(
                fontSize: 25,
                color: Formulas.temperatureColor(weather.mainTemmp),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Min Temp: ${weather.mainTempMin}°F',
              style: textStyle(20),
            ),
            Text(
              'Max Temp: ${weather.mainTempMax}°F',
              style: textStyle(20),
            ),
            Text(
              'Humidity: ${weather.mainHumidity}',
              style: textStyle(20),
            ),
            Text(
              'Wind: ${weather.windSpeed} mph',
              style: textStyle(20),
            ),
            Text(
              'Wind Gust: ${weather.windGust} mph',
              style: textStyle(20),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Wind Direction: ${weather.windDeg}°',
                  style: textStyle(20),
                ),
                const SizedBox(width: 20),
                windDirectionPointer(weather),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget header(WeatherModel weather) {
  return Column(
    children: [
      Text(
        weather.name!,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Text(
        Formulas.getDate(weather.date!, weather.timezone!),
        style: textStyle(20),
      ),
      Text(
        Formulas.getTime(weather.date!, weather.timezone!),
        style: textStyle(20),
      )
    ],
  );
}

Widget timeInfo(WeatherModel weather) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Center(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Date: ${Formulas.getDate(weather.date!, weather.timezone!)}',
                  style: textStyle(10)),
              Text(
                  'Time: ${Formulas.getTime(weather.date!, weather.timezone!)}',
                  style: textStyle(10)),
              // Text(
              //     'Sunrise: ${_getSunRiseSunset(weather.sysSunrise!, weather.timezone!)}',
              //     style: textStyle(10)),
              // Text(
              //     'Sunset: ${_getSunRiseSunset(weather.sysSunSet!, weather.timezone!)}',
              // style: textStyle(10)),
            ],
          ),
        ),
      ),
    ),
  );
}

TextStyle textStyle(double size) {
  return TextStyle(
    fontSize: size,
    color: const Color.fromARGB(255, 8, 95, 85),
  );
}

Widget windDirectionPointer(WeatherModel weather) {
  return Container(
    width: 25,
    height: 25,
    color: Colors.grey.withOpacity(.2),
    child: CustomPaint(
      foregroundPainter: CirclePainter(weather: weather),
    ),
  );
}

class CirclePainter extends CustomPainter {
  final WeatherModel weather;
  CirclePainter({required this.weather});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    final Paint circlePaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.blue
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);

    final Paint pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final Paint linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;

    final Paint axesPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    double angle = (90.0 - 90.0) * (pi / 180.0);
    double pointX = center.dx + radius * cos(angle);
    double pointY = center.dy + radius * sin(angle);
    canvas.drawLine(center, Offset(pointX, pointY), axesPaint);

    angle = (180.0 - 90.0) * (pi / 180.0);
    pointX = center.dx + radius * cos(angle);
    pointY = center.dy + radius * sin(angle);
    canvas.drawLine(center, Offset(pointX, pointY), axesPaint);

    angle = (270.0 - 90.0) * (pi / 180.0);
    pointX = center.dx + radius * cos(angle);
    pointY = center.dy + radius * sin(angle);
    canvas.drawLine(center, Offset(pointX, pointY), axesPaint);

    angle = (360.0 - 90.0) * (pi / 180.0);
    pointX = center.dx + radius * cos(angle);
    pointY = center.dy + radius * sin(angle);
    canvas.drawLine(center, Offset(pointX, pointY), axesPaint);

    angle = (weather.windDeg!.toDouble() - 90) * (pi / 180.0);
    pointX = center.dx + radius * cos(angle);
    pointY = center.dy + radius * sin(angle);

    canvas.drawCircle(Offset(pointX, pointY), 2.0, pointPaint);
    canvas.drawLine(center, Offset(pointX, pointY), linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

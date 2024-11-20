import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formulas {
  static String getTime(int milliseconds, int timeZoneMilliseconds) {
    return DateFormat('hh:mm:ss a')
        .format(DateTime.fromMillisecondsSinceEpoch((milliseconds) * 1000))
        .toString();
  }

  static String getSunRiseSunset(int milliseconds, int timeZoneMilliseconds) {
    return DateFormat('hh:mm:ss a')
        .format(DateTime.fromMillisecondsSinceEpoch(
            (milliseconds + timeZoneMilliseconds) * 1000))
        .toString();
  }

  static String getDate(int milliseconds, int timeZoneMilliseconds) {
    return DateFormat('EEEE, MMM dd, yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch((milliseconds) * 1000));
  }

  static Color temperatureColor(double? temp) {
    if (temp! >= 90.0) {
      return Colors.red;
    }
    if (temp < 90 && temp >= 80) {
      return const Color.fromARGB(255, 236, 136, 136);
    }
    if (temp < 80 && temp >= 70) {
      return const Color.fromARGB(255, 200, 154, 148);
    }
    if (temp < 70 && temp >= 60) {
      return const Color.fromARGB(255, 37, 7, 177);
    }
    if (temp < 60 && temp >= 50) {
      return const Color.fromARGB(255, 37, 7, 121);
    }
    if (temp < 50 && temp >= 40) {
      return const Color.fromARGB(255, 37, 7, 230);
    }
    if (temp < 40 && temp >= 30) {
      return const Color.fromARGB(255, 37, 7, 240);
    }
    if (temp < 30) {
      return const Color.fromARGB(255, 3, 7, 255);
    }
    return const Color.fromARGB(255, 0, 0, 0);
  }
}

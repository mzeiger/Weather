// import 'package:weather/models/forecast_model.dart';

// ForecastModel forecastModel = ForecastModel();
// List<ForecastModel> forecasts = [];
// List? days;

// List<ForecastModel> forecastCollector(double latitude, double longitude) {
//   forecastModel.getForecast(latitude, longitude).then((value) {
//     // days = value['days'];
//     for (var day in value['days']) {
//       if (day['source'] == 'fcst') {
//         ForecastModel singleForecast = ForecastModel();
//         singleForecast.source = day['source'];
//         singleForecast.datetime = day['datetime'];
//         singleForecast.description = day['description'];
//         singleForecast.sunrise = day['sunrise'];
//         singleForecast.sunset = day['sunset'];
//         singleForecast.tempmax = day['tempmax'];
//         singleForecast.tempmin = day['tempmin'];
//         forecasts.add(singleForecast);
//       }
//     }
//   });
//   return forecasts;
// }

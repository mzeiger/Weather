import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/geo_model.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/gps_page.dart';
import 'package:weather/pages/wait_page.dart';
import 'package:weather/pages/weather_lon_lat_page.dart';
import 'package:weather/pages/weather_page.dart';

// Position? _currentPosition;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _zipFormKey = GlobalKey<FormState>();
  final _cityFormKey = GlobalKey<FormState>();
  final _zipRegExp = RegExp(r'\d\d\d\d\d');
  WeatherModel weatherModel = WeatherModel();
  GeoModel geoModel = GeoModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('OpenWeather'),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(75, 110, 110, 241),
                    Color.fromARGB(200, 13, 13, 77),
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                zipcodeInput(),
                const SizedBox(height: 10),
                cityInput(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(thickness: 5),
                ),
                weatherByCurrentLocation(),
                const SizedBox(height: 10),
                gpsButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget zipcodeInput() {
    TextEditingController zipController = TextEditingController();
    return Form(
      key: _zipFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (_zipRegExp.hasMatch(value!)) {
                  return null;
                } else {
                  return "Enter a valid 5-digit zip code";
                }
              },
              controller: zipController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: const Text('Enter a U.S. Zipcode'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                suffixIcon: IconButton(
                  onPressed: () => zipController.clear(),
                  icon: const Icon(Icons.clear),
                ),
              ),
              maxLength: 5,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {
              if (_zipFormKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                weatherModel
                    .getWeatherByZip(zipController.text)
                    .then((weatherResponse) {
                  if (weatherResponse['cod'] != 200) {
                    if (mounted) {
                      showErrorDialog(context,
                          "${weatherResponse['cod']}: ${weatherResponse['message']}");
                    }
                  } else {
                    geoModel
                        .getSunriseSunset(weatherResponse['coord']['lat'],
                            weatherResponse['coord']['lon'])
                        .then((geo) {
                      WeatherModel weather = populateWeatherModel(
                          weatherModel, weatherResponse, geo);
                      if (mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WeatherPage(weather: weather)));
                      }
                    });
                  }
                });
              }
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            child: const Text(
              'Get Current Weather by Zipcode',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget cityInput() {
    TextEditingController cityController = TextEditingController();
    return Form(
      key: _cityFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a city";
                } else {
                  return null;
                }
              },
              controller: cityController,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                label: const Text('Enter a City'),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                suffixIcon: IconButton(
                  onPressed: () => cityController.text = '',
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {
              if (_cityFormKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
                weatherModel
                    .getWeatherByCity(cityController.text)
                    .then((weatherResponse) {
                  if (weatherResponse['cod'] != 200) {
                    if (mounted) {
                      showErrorDialog(context,
                          "${weatherResponse['cod']}: ${weatherResponse['message']}");
                    }
                  } else {
                    geoModel
                        .getSunriseSunset(weatherResponse['coord']['lat'],
                            weatherResponse['coord']['lon'])
                        .then((geo) {
                      WeatherModel weather = populateWeatherModel(
                          weatherModel, weatherResponse, geo);
                      if (mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WeatherPage(weather: weather)));
                      }
                    });
                  }
                });
              }
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            child: const Text(
              'Get Current Weather by City',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget weatherByCurrentLocation() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const WaitPage()));
              Geolocator.getCurrentPosition().then(
                (currentPosition) {
                  // now have lat and long
                  geoModel
                      .getLocationByLatLon(
                          currentPosition.latitude, currentPosition.longitude)
                      .then(
                    (geoMap) {
                      geoModel
                          .getSunriseSunset(currentPosition.latitude,
                              currentPosition.longitude)
                          .then(
                        (sun) {
                          GeoModel geo =
                              populateGeoModel(geoModel, geoMap, sun);
                          weatherModel
                              .getWeatherByCurrentLoaction(
                                  currentPosition.latitude,
                                  currentPosition.longitude)
                              .then(
                            (weatherResponse) {
                              if (weatherResponse['cod'] != 200) {
                                if (mounted) {
                                  showErrorDialog(context,
                                      "${weatherResponse['cod']}: ${weatherResponse['message']}");
                                }
                              } else {
                                WeatherModel weather = populateWeatherModel(
                                    weatherModel, weatherResponse, sun);
                                if (mounted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => WeatherLLPage(
                                          geoModel: geo, weather: weather),
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue)),
            child: const Text(
              'Get Current Weather at this Location',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget gpsButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const GpsPage()));
      },
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue)),
      child: const Text(
        'GPS Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // void _getCurrentLocation() {
  //   Geolocator.getCurrentPosition().then((Position position) {
  //     _currentPosition = position;
  //   }).catchError((e) {
  //     if (kDebugMode) {
  //       print('Location error: $e');
  //     }
  //   });
  // }

  WeatherModel populateWeatherModel(
      WeatherModel model, Map<String, dynamic> data, Map<String, dynamic> geo) {
    try {
      model.weatherMain = data['weather'][0]['main'] ?? '';
      model.weatherDescription = data['weather'][0]['description'] ?? '';
      model.weatherIcon = data['weather'][0]['icon'];
      model.mainTemmp = data['main']['temp'].toDouble() ?? -1000000000000.0;
      model.mainFeelsLike = data['main']['feels_like'] ?? -0.0;
      model.mainTempMin =
          data['main']['temp_min'].toDouble() ?? -1000000000000.0;
      model.mainTempMax =
          data['main']['temp_max'].toDouble() ?? -1000000000000.0;
      model.mainPressure = data['main']['pressure'] ?? -1000000000000;
      model.mainHumidity = data['main']['humidity'] ?? -1000000000000;
      model.windSpeed = data['wind']['speed'].toDouble() ?? -10000.0;
      model.windDeg = data['wind']['deg'] ?? 0;
      if (!data['wind'].containsKey('gust')) {
        model.windGust = 0.0;
      } else {
        model.windGust = data['wind']['gust'].toDouble() ?? -1000000000000.0;
      }
      model.sysSunrise = data['sys']['sunrise'] ?? -1000000000000;
      model.sysSunSet = data['sys']['sunset'] ?? -1000000000000;
      model.sysCountry = data['sys']['country'] ?? '';
      model.name = data['name'] ?? '---';
      model.timezone = data['timezone'] ?? -1000000000000;
      model.coordLatitude = data['coord']['lat'].toDouble() ?? -1000000000000.0;
      model.coordLongitude =
          data['coord']['lon'].toDouble() ?? -1000000000000.0;
      model.date = data['dt'] ?? -1000000000000;
      model.sunrise = geo['results']['sunrise'];
      model.sunset = geo['results']['sunset'];
    } catch (e) {
      // print(e.toString());
    }
    return model;
  }

  GeoModel populateGeoModel(
      GeoModel model, Placemark placeMark, Map<String, dynamic> sun) {
    model.administrativeArea = placeMark.administrativeArea;
    model.country = placeMark.country;
    model.isoCountryCode = placeMark.isoCountryCode;
    model.locality = placeMark.locality;
    model.postalCode = placeMark.postalCode;
    model.street = placeMark.street;
    model.subAdministrativeArea = placeMark.subAdministrativeArea;
    model.thoroughfare = placeMark.thoroughfare;
    model.sunrise = sun['results']['sunrise'];
    model.sunset = sun['results']['sunset'];
    return model;
  }

  // WeatherOnecallModel populateOnecallModel(WeatherOnecallModel model, data) {
  //   try {
  //     model.date = data['current']['dt'];
  //     model.sunrise = data['current']['sunrise'];
  //     model.sunset = data['current']['sunset'];
  //     model.temp = data['current']['temp'];
  //     model.feelsLike = data['current']['feels_like'];
  //     model.windSpeed = data['current']['wind_speed'];
  //     model.windDeg = data['current']['wind_deg'];
  //     model.main = data['current']['weather'][0]['main'];
  //     model.description = data['current']['weather'][0]['description'];
  //     model.icon = data['current']['weather'][0]['icon'];
  //     model.timezone = data['timezone'];
  //     model.lat = data['lat'];
  //     model.lon = data['lon'];
  //     return model;
  //   } catch (e) {
  //     throw Exception('Onecall Model not completed');
  //   }
  // }

  void showErrorDialog(context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text(
          'ERROR',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.lightBlue)),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

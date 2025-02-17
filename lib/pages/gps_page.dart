import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/helpers/gps.dart';

class GpsPage extends StatefulWidget {
  const GpsPage({super.key});

  @override
  State<GpsPage> createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage> {
  final GPS _gps = GPS();
  Position? _userPosition;
  Exception? _exception;

  void _handlePositionStream(Position position) {
    setState(() {
      _userPosition = position;
    });
  }

  @override
  void initState() {
    super.initState();
    _gps.startPositionStream(_handlePositionStream).catchError((e) {
      setState(() {
        _exception = e;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _gps.stopPositionStream();
  }

  String metersToFeet(double meters) {
    return (meters * 3.28084).toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    Widget? childWidget;
    if (_exception != null) {
      childWidget = const Text('Please provide GPS permissions"');
    } else if (_userPosition == null) {
      childWidget = const CircularProgressIndicator();
    } else {
      childWidget = showPosition();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('GPS'),
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pexels-pixabay-87651.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              child: childWidget,
            ),
          ),
        ));
  }

  Widget showPosition() {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * .8,
      // color: const Color.fromARGB(200, 228, 206, 206),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color.fromARGB(160, 228, 190, 190),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Longitude: ${_userPosition!.longitude.toStringAsFixed(6)}',
            style: _textStyle(),
          ),
          Text('Latitude: ${_userPosition!.latitude.toStringAsFixed(6)}',
              style: _textStyle()),
          Text('Altitude: ${metersToFeet(_userPosition!.altitude)}',
              style: _textStyle()),
          Text('Accuracy: ${_userPosition!.accuracy.toStringAsFixed(4)}',
              style: _textStyle()),
          Text(
              'Alt. Accuracy: ${_userPosition!.altitudeAccuracy.toStringAsFixed(4)}',
              style: _textStyle()),
          Text('Speed: ${_userPosition!.speed.toStringAsFixed(4)}',
              style: _textStyle()),
        ],
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 70, 54, 6),
        fontSize: 14);
  }
}

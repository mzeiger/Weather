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
        body: Center(
          child: Container(
            child: childWidget,
          ),
        ));
  }

  Widget showPosition() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Longitude: ${_userPosition!.longitude.toString()}'),
        Text('Latitude: ${_userPosition!.latitude.toString()}'),
        Text('Altitude: ${_userPosition!.altitude.toString()}'),
        Text('Accuracy: ${_userPosition!.accuracy.toString()}'),
        Text('Alt. Accuracy: ${_userPosition!.altitudeAccuracy.toString()}'),
        Text('Speed: ${_userPosition!.speed.toStringAsFixed(2)}'),
      ],
    );
  }
}

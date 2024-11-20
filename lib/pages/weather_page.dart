import 'package:flutter/material.dart';
import 'package:weather/Widgets/weather_widgets.dart';
import 'package:weather/models/weather_model.dart';

class WeatherPage extends StatelessWidget {
  final WeatherModel weather;

  const WeatherPage({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Weather Details'),
            centerTitle: true,
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
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
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                header(weather),
                const SizedBox(height: 10),
                imageFromOpenWeather(weather),
                const SizedBox(height: 5),
                const SizedBox(height: 10),
                keyInfo(weather),
                // timeInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//   Widget _windDirectionPointer() {
//     return Container(
//       width: 50,
//       height: 50,
//       color: Colors.grey.withOpacity(.2),
//       child: CustomPaint(
//         foregroundPainter: CirclePainter(weather: weather),
//       ),
//     );
//   }
// }

// class CirclePainter extends CustomPainter {
//   final WeatherModel weather;
//   CirclePainter({required this.weather});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Offset center = Offset(size.width / 2, size.height / 2);
//     final double radius = size.width / 2;

//     final Paint circlePaint = Paint()
//       ..strokeWidth = 2
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke;
//     canvas.drawCircle(center, radius, circlePaint);

//     final Paint pointPaint = Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.fill;

//     double angle = weather.windDeg!.toDouble() * (pi / 180.0);
//     double pointX = center.dx + radius * cos(angle);
//     double pointY = center.dy + radius * sin(angle);

//     canvas.drawCircle(Offset(pointX, pointY), 5.0, pointPaint);
//   }

  // @override
  // bool shouldRepaint(CustomPainter oldDelegate) => false;
}

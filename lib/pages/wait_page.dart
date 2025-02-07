import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitPage extends StatelessWidget {
  const WaitPage({super.key});

  final spinkit = const SpinKitPouringHourGlassRefined(
    color: Color.fromRGBO(11, 160, 18, 0.808),
    size: 300,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          //child: CircularProgressIndicator(color: Colors.blue),
          child: spinkit,
        ),
      ),
    );
  }
}

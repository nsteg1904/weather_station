import 'package:flutter/material.dart';
import 'package:weather_station/screens/app/home/forecast.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          flex: 3,
          child: Center(
            child: Text('7°'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Forecast()
        ),
      ],
    );
  }
}

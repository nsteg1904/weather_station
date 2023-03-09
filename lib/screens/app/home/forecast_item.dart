import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_station/model/weather_forecast_data.dart';

class ForecastItem extends StatelessWidget {
  final WeatherForecastData fData;
  const ForecastItem({Key? key, required this.fData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Icon(Icons.cloud, size: 26),
              Text(fData.tempMin.toString(), style: const TextStyle(fontSize: 24)),
              Text(fData.tempMax.toString(), style: const TextStyle(fontSize: 24)),
              Text(DateFormat('E').format(fData.date), style: const TextStyle(fontSize: 24))
            ],
          ),
        ),
      ],
    );
  }
}


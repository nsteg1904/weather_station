import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_station/model/weather_forecast_data.dart';
import 'package:weather_station/screens/app/home/forecast.dart';
import 'package:weather_station/services/Database/forecast_database.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 3,
          child: Center(
            child: Text('7°'),
          ),
        ),
        Expanded(
          flex: 1,
          child: StreamProvider<List<WeatherForecastData>>.value(
            initialData: const [],
            value: WeatherForecastDatabaseService().latestFiveWeatherForecasts,
            child: const Forecast()
          )
        ),
      ],
    );
  }
}

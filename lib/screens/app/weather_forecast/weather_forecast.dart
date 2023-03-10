import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_station/screens/app/weather_forecast/forecast.dart';

import '../../../model/weather_forecast_data.dart';
import '../../../services/Database/forecast_database.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<WeatherForecastData>>.value(
        initialData: const [],
        value: WeatherForecastDatabaseService().latestFiveWeatherForecasts,
        child: const Forecast()
    );
  }
}

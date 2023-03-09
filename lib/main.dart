import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_station/screens/app/page.dart';
import 'package:weather_station/services/Database/forecast_database.dart';
import 'package:weather_station/services/weather_forecast.dart';
import 'model/weather_forecast_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WeatherForecastDatabaseService weatherForecastDatabaseService = WeatherForecastDatabaseService();

  DateTime lastUpdate = await weatherForecastDatabaseService.getLastUpdate();
  DateTime now = DateTime.now();

  Duration difference = now.difference(lastUpdate);

  if(difference.inHours >= 1){
    WeatherForecastService weatherForecastService = WeatherForecastService();
    List<WeatherForecastData> weatherForecastList =  await weatherForecastService.getWeatherForecast();

    await weatherForecastDatabaseService.updateWeatherForecast(weatherForecastList);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather Station',
      home: ShowAppPage()
    );
  }
}




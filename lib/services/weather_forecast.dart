import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_station/model/weather_forecast_data.dart';
import 'package:weather_station/services/secret_keys.dart';

class WeatherForecastService {
  final String apiKey = accuWeatherApiKey;
  final String metric = 'true';
  final String language = 'de';
  final String locationKey = '179316'; //Borghorst

  Future<List<WeatherForecastData>> getWeatherForecast() async {
    List<WeatherForecastData> weatherForecasts = [];
    final response = await http.get(Uri.parse('http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey?apikey=$apiKey&language=$language&metric=$metric'));

    if(response.statusCode == 200){
      final String responseString = response.body;
      final weatherData = jsonDecode(responseString);

      for(var data in weatherData['DailyForecasts']){
        weatherForecasts.add(WeatherForecastData(
            date: DateTime.parse(data['Date']),
            tempMin: data['Temperature']['Minimum']['Value'],
            tempMax: data['Temperature']['Maximum']['Value'],
            dayIcon: data['Day']['Icon'],
            dayWeather: data['Day']['IconPhrase'],
            nightIcon: data['Night']['Icon'],
            nightWeather: data['Night']['IconPhrase'],
        ));
      }
    }
    return weatherForecasts;
  }

}
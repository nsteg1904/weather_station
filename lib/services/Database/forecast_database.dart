import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../model/weather_forecast_data.dart';

class WeatherForecastDatabaseService {
  final CollectionReference weatherForecastCollection = FirebaseFirestore.instance.collection('weatherForecasts');

  Future _updateLastUpdate() async {
    try{
      return await weatherForecastCollection.doc('lastUpdate').set({
        'lastUpdate': DateTime.now(),
      });
    }catch (e){
      return null;
    }
  }

  Future updateWeatherForecast(List<WeatherForecastData> forecastList) async{
    _updateLastUpdate();

    for(WeatherForecastData weatherForecast in forecastList){
      try{
        DateFormat formatter = DateFormat('yyyy-MM-dd');
        await weatherForecastCollection.doc(formatter.format(weatherForecast.date)).set({ //as date
          'date': weatherForecast.date, //as timestamp
          'tempMin': weatherForecast.tempMin,
          'tempMax': weatherForecast.tempMax,
          'dayIcon': weatherForecast.dayIcon,
          'dayWeather': weatherForecast.dayWeather,
          'nightIcon': weatherForecast.nightIcon,
          'nightWeather': weatherForecast.nightWeather,
        });

      } catch (e){
        return null;
      }
    }
  }

  List<WeatherForecastData> _weatherForecastListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return WeatherForecastData(
          date: doc.get('date').toDate(),
          tempMin: doc.get('tempMin'),
          tempMax: doc.get('tempMax'),
          dayIcon: doc.get('dayIcon'),
          dayWeather: doc.get('dayWeather'),
          nightIcon: doc.get('nightIcon'),
          nightWeather: doc.get('nightWeather'),
      );
    }).toList();
  }

  Stream<List<WeatherForecastData>> get latestFiveWeatherForecasts{
    return weatherForecastCollection
        .orderBy('date', descending: true)
        .limit(5)
        .snapshots()
        .map(_weatherForecastListFromSnapshot);
  }

  // Future<List<WeatherForecastData>> getLatest5WeatherForecasts() {
  //   return weatherForecastCollection
  //       .orderBy('date', descending: true)
  //       .limit(5)
  //       .get()
  //       .then(_weatherForecastListFromSnapshot);
  // }

  Future<DateTime> getLastUpdate() async {
    return await weatherForecastCollection
        .doc('lastUpdate')
        .get()
        .then((doc) => doc.get('lastUpdate').toDate());
  }
}
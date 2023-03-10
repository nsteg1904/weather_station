import 'package:flutter/material.dart';
import 'package:weather_station/model/weather_forecast_data.dart';

class ForecastItem extends StatefulWidget {
  final WeatherForecastData fData;
  const ForecastItem({Key? key, required this.fData}) : super(key: key);

  @override
  State<ForecastItem> createState() => _ForecastItemState();
}

class _ForecastItemState extends State<ForecastItem> {

  AssetImage getWeatherIcon(int weatherIcon){
    try{
      return AssetImage('assets/weatherIcons/${weatherIcon.toString()}.png');
    } catch (e){
      return const AssetImage('assets/weatherIcons/1.png');
    }
  }

  String getWeekday(DateTime date){
    switch(date.weekday){
      case 1: return 'Mo';
      case 2: return 'Di';
      case 3: return 'Mi';
      case 4: return 'Do';
      case 5: return 'Fr';
      case 6: return 'Sa';
      case 7: return 'So';
      default: return 'F';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.fromLTRB(4.0, 6.0, 4.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: IntrinsicWidth(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  getWeekday(widget.fData.date),
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: const Color(0x40000000),
                  backgroundImage: getWeatherIcon(widget.fData.dayIcon),
                  radius: 25.0,
                ),
              ),
              Expanded(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: getWeatherIcon(widget.fData.nightIcon),
                  radius: 25.0,
                ),
              ),
              Expanded(
                child: Text(
                  '${widget.fData.tempMin} °C',
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
              Expanded(
                child: Text(
                  '${widget.fData.tempMax.toString()} °C',
                  style: const TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



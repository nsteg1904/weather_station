import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/weather_forecast_data.dart';
import 'forecast_item.dart';

class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  @override
  Widget build(BuildContext context) {

    final weatherForecasts = Provider.of<List<WeatherForecastData>>(context).reversed.toList();

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xbf2b4261),
      //   borderRadius: BorderRadius.circular(10.0),
      ),
      // margin: const EdgeInsets.all(10.0),
      // padding: const EdgeInsets.all(2),

      child: ListView.builder(
        itemCount: weatherForecasts.length,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return ForecastItem(fData: weatherForecasts[index]);
        },

      ),
    );
  }

}

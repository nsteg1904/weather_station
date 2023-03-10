import 'package:flutter/material.dart';
import 'package:weather_station/screens/app/weather_forecast/weather_forecast.dart';
import 'package:weather_station/screens/app/navigation_bar.dart';
import 'package:weather_station/screens/app/settings/settings.dart';
import 'package:weather_station/screens/app/statistics/statistics.dart';

import 'home/home.dart';

class ShowAppPage extends StatefulWidget {
  const ShowAppPage({Key? key}) : super(key: key);

  @override
  State<ShowAppPage> createState() => _ShowAppPageState();
}

class _ShowAppPageState extends State<ShowAppPage> {

  Widget page = const Home();

  void changeView(int pageSelection){
    switch(pageSelection){
      case 0:
        setState(() => page = const Home());
        break;
      case 1:
        setState(() => page = const WeatherForecast());
        break;
      case 2:
        setState(() => page = const Statistics());
        break;
      case 3:
        setState(() => page = const Settings());
        break;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/sunny.png'),
            fit: BoxFit.cover,
          )
        ),
        child: page
      ),
      bottomNavigationBar: NavBar(changeView: changeView)
    );
  }
}



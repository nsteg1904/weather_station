class WeatherForecastData {
  final DateTime date;
  final double tempMin;
  final double tempMax;
  final int dayIcon;
  final String dayWeather;
  final int nightIcon;
  final String nightWeather;


  WeatherForecastData({
    required this.date,
    required this.tempMin,
    required this.tempMax,
    required this.dayIcon,
    required this.dayWeather,
    required this.nightIcon,
    required this.nightWeather,
  });

}
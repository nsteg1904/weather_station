import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xbf2b4261),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(8),
            child: Column(
              children: const [
                Icon(Icons.cloud, size: 26),
                Text('12°', style: TextStyle(fontSize: 24)),
                Text('2°', style: TextStyle(fontSize: 24)),
                Text('Do', style: TextStyle(fontSize: 24))
              ],
            ),
          ),
        ],
      ),
    );
  }

}

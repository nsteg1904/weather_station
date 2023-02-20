import 'package:flutter/material.dart';
import 'package:weather_station/shared/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/night.jpg'),
            fit: BoxFit.cover,
          )
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6485FF),
        elevation: 0.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,

              ),
              label: '.'
          ),
        ],
      ),
    );
  }
}

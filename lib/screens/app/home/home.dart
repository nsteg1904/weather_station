import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Text('Hello'),
        Container(
          color: const Color(0xFFFFFFFF),
          child: Row(
            children: [
              Container(
                // padding: const EdgeInsets.all(60.0),
                color: const Color(0xFFB73333),
                // alignment: Alignment.topCenter,
                height: 150,
                child: Column(
                  children: const [
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 36,
                    ),
                    Text(
                      '13°',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      '3°',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      'Do',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      ],
    );
  }
}

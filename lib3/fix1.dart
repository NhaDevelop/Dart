import 'package:flutter/material.dart';

class MyWeather extends StatelessWidget {
  const MyWeather({super.key, 
    required this.day,
    required this.weatherIcon, 
    required this.temperature
    });

  final String day;
  final IconData weatherIcon ;
  final String temperature;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style:const TextStyle(
              color: Colors.grey,
            ),
          ),
          Icon(
            weatherIcon,
          ),
          Text(
            temperature,
            style:const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(
    MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title:const Text('Weather App'),
        ),
        body:const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyWeather(
              day: 'Monday',
              weatherIcon: Icons.wb_sunny,
              temperature: '30°C',
            ),
            MyWeather(
              day: 'Tuesday',
              weatherIcon: Icons.wb_cloudy,
              temperature: '25°C',
            ),
            MyWeather(
              day: 'Wednesday',
              weatherIcon: Icons.wb_sunny,
              temperature: '35°C',
            ),
            MyWeather(
              day: 'Thursday', 
              weatherIcon: Icons.wb_cloudy,
              temperature: '20°C',
              ),
              MyWeather(
              day: 'Friday',
              weatherIcon: Icons.wb_cloudy,
              temperature: '25°C',
            ),
            MyWeather(
              day: 'Saturday',
              weatherIcon: Icons.wb_sunny,
              temperature: '35°C',
            ),
            MyWeather(
              day: 'Sunday', 
              weatherIcon: Icons.wb_cloudy,
              temperature: '20°C',
              ),
          ],
        ),
      ),
    ),
  );
}
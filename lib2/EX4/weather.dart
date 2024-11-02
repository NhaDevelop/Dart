import 'package:flutter/material.dart';

// Enum for different weather conditions
enum WeatherCondition { sunny, rainy, cloudy, snowy }

class WeatherForecast extends StatelessWidget {
  final String dayOfWeek;
  final WeatherCondition condition;
  final int minTemp;
  final int maxTemp;

  const WeatherForecast({
    super.key,
    required this.dayOfWeek,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
  });

  // Method to get the appropriate icon based on the weather condition
  IconData getWeatherIcon() {
    switch (condition) {
      case WeatherCondition.sunny:
        return Icons.wb_sunny;
      case WeatherCondition.rainy:
        return Icons.grain;
      case WeatherCondition.cloudy:
        return Icons.cloud;
      case WeatherCondition.snowy:
        return Icons.ac_unit;
      default:
        return Icons.wb_sunny;
    }
  }

  // Method to get the background color based on the weather condition
  Color getBackgroundColor() {
    switch (condition) {
      case WeatherCondition.sunny:
        return Colors.orangeAccent;
      case WeatherCondition.rainy:
        return Colors.blueAccent;
      case WeatherCondition.cloudy:
        return Colors.grey;
      case WeatherCondition.snowy:
        return Colors.lightBlueAccent;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: getBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Icon(
            getWeatherIcon(),
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            '$maxTemp° / $minTemp°',
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WeatherForecastDemo extends StatelessWidget {
  const WeatherForecastDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Forecast')),
      body: const Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WeatherForecast(
                dayOfWeek: 'Sun',
                condition: WeatherCondition.sunny,
                minTemp: 3,
                maxTemp: 15,
              ),
              WeatherForecast(
                dayOfWeek: 'Mon',
                condition: WeatherCondition.rainy,
                minTemp: 7,
                maxTemp: 12,
              ),
              WeatherForecast(
                dayOfWeek: 'Tue',
                condition: WeatherCondition.cloudy,
                minTemp: 0,
                maxTemp: 9,
              ),
              WeatherForecast(
                dayOfWeek: 'Wed',
                condition: WeatherCondition.snowy,
                minTemp: -2,
                maxTemp: 5,
              ),
              WeatherForecast(
                dayOfWeek: 'Thu',
                condition: WeatherCondition.snowy,
                minTemp: -2,
                maxTemp: 5,
              ),
              WeatherForecast(
                dayOfWeek: 'Fri',
                condition: WeatherCondition.snowy,
                minTemp: -2,
                maxTemp: 5,
              ),
              WeatherForecast(
                dayOfWeek: 'Sat',
                condition: WeatherCondition.snowy,
                minTemp: -4,
                maxTemp: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: WeatherForecastDemo(),
  ));
}

import 'package:flutter/material.dart';
import 'screen/welcome.dart';
import 'screen/temperature.dart';

void main() {
  runApp(const TemperatureApp());
}

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomeScreen = true;

  void toggleScreen() {
    setState(() {
      isWelcomeScreen = !isWelcomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isWelcomeScreen
          ? WelcomeScreen(onStart: toggleScreen)
          : TemperatureScreen(),
    );
  }
}

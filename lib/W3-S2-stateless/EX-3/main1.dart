import 'package:flutter/material.dart';
import 'main2.dart';


void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(
              buttonName: 'OOP',
              startColor: 0xFF0000,
              endColor: 0xff0B3CBD,
            ),
            MyWidget(
              buttonName: 'Flutter',
              startColor: 0xFF0000,
              endColor: 0xff0B3CBD,
            ),
            MyWidget(
              buttonName: 'Dart',
              startColor: 0xff4E7DF5,
              endColor: 0xFF0000,
            ),
          ],
        ),
      ),
    ),
  ));
}

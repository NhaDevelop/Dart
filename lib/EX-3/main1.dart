import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.buttonName,
    required this.startColor,
    required this.endColor,
  });

  final String buttonName;
  final int startColor;
  final int endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.only(left: 80, right: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          colors: [Color(startColor), Color(endColor)],
        ),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 35,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(
              buttonName: 'OOP',
              startColor: 0xff4E7DF5,
              endColor: 0xff0B3CBD,
            ),
            MyWidget(
              buttonName: 'Flutter',
              startColor: 0xff4E7DF5,
              endColor: 0xff4E7DF5,
            ),
            MyWidget(
              buttonName: 'Dart',
              startColor: 0xff4E7DF5,
              endColor: 0xff4E7DF5,
            ),
          ],
        ),
      ),
    ),
  ));
}

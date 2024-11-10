import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color(0xff0B3CBD)])),
              child: const Text(
                "HELLO1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color(0xff0B3CBD)])),
              child: const Text(
                "HELLO2",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: const LinearGradient(
                      colors: [Color(0xff4E7DF5), Color(0xff0B3CBD)])),
              child: const Text(
                "HELLO3",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    decoration: TextDecoration.none),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

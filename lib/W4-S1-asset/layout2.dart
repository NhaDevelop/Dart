import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            Container(height: 100, color: Colors.blue),
            Container(height: 100, color: Colors.green),
          ],
        ),
      ),
    ),
  );
}
import 'package:flutter/material.dart';
void main() {
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            Container(height: 1000, color: Colors.blue),
            Expanded(child: Container(height: 1000, color: Colors.green)),
          ],
        ),
      ),
    ),
  );
}
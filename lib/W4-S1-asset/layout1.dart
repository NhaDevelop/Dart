import 'package:flutter/material.dart';

 void main() {
  runApp(
    MaterialApp(
        home: Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.red,
        child: Container(color: Colors.green, width: 30, height: 30),
      ),
    )),
  );
}



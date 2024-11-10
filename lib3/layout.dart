import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Center(
      child: Container( width: 1000, height:10000, 
        padding: const EdgeInsets.all(20),
        color: Colors.red,
        child: Container(color: Colors.green, width: 30, height: 30),
      ),
    )),
  );
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Numbers'),
        ),
        body: NumberListWidget(),
      ),
    );
  }
}

class NumberListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Generate a list of numbers using map
    final numbers = List.generate(10, (index) => index + 1);

    return ListView(
      children: numbers.map((number) {
        return ListTile(
          title: Text('Number: $number'),
        );
      }).toList(),
    );
  }
}
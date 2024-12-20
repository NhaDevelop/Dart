import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List of Numbers'),
        ),
        body: const NumberListWidget(),
      ),
    );
  }
}

class NumberListWidget extends StatelessWidget {
  const NumberListWidget({super.key});

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
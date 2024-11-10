// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Selectable Button Example')),
        body: const Center(child: SelectButton()),
      ),
    );
  }
}

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
 
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
 
  bool isSelected = true;

  // Define a function to toggle the button's state
  void toggleSelection() {
    setState(() {
      isSelected = !isSelected; // Toggle the selected state
    });
  }

  @override 
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: toggleSelection,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey, // Background color based on state
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        isSelected ? 'not select' : 'select', // Text label based on state
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

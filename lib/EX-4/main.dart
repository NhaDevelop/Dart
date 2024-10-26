import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MainScreen(),
    ),
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), // Padding for the outer container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(text: "OOP", color: Colors.blue[100]), // CustomCard for OOP
          CustomCard(text: "DART", color: Colors.blue[300]), // CustomCard for DART
          CustomCard(text: "FLUTTER", color: Colors.blue[600]), // CustomCard for FLUTTER
        ],
      ),
    );
  }
}

// Step 1: Create CustomCard StatelessWidget
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.text,
    this.color,
    this.gradient,
  });

  final String text;
  final Color? color;
  final LinearGradient? gradient; // Optional gradient for the card

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), // Vertical spacing
      padding: const EdgeInsets.all(20), // Padding inside the container
      decoration: BoxDecoration(
        color: color, // Background color
        gradient: gradient, // Background gradient if provided
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

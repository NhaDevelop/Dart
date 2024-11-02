// ignore: file_names
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20), 
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCard(
              icon: Icons.sports_soccer,
              text: "FOOTBALL",
              color: Color.fromARGB(255, 43, 210, 48)),
             CustomCard(
              icon: Icons.code,
              text: "DART",
              color: Color.fromARGB(255, 155, 179, 156)),
        ],
        
         
              
        
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.text,
      this.color,
      this.gradient,
      required this.icon});
  final IconData icon;
  final String text;
  final Color? color;
  final LinearGradient? gradient; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10), 
      padding: const EdgeInsets.all(20), 
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(15), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: Colors.white), 
          const SizedBox(width: 10), 
          Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MainScreen(),
    ),
  ));
}

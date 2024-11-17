import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: BlueContainer(),
  ));
}

class BlueContainer extends StatelessWidget {
  const BlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Step 2: Set margin and padding for the outer container
      margin: const EdgeInsets.all(20), // Adds space outside the container
      padding: const EdgeInsets.all(20), // Adds space inside the container
      
      
      // Step 2: Set box decoration for the outer container
      decoration: BoxDecoration(
        color: Colors.blue, // Sets the background color to blue
        borderRadius: BorderRadius.circular(15), // Rounds the corners
      ),
      
      // Step 3: Add inner content with Center and Text
      child: const Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(
            fontSize: 24,          // Sets font size
            color: Colors.white,    // Sets font color
            fontWeight: FontWeight.bold, // Makes text bold
          ),
        ),
      ),
    );
  }
}

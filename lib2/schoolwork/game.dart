import 'package:flutter/material.dart';
import 'dart:math';

const List<String> diceImages = [
  'assets/IMG/dice-1.png',
  'assets/IMG/dice-2.png',
  'assets/IMG/dice-3.png',
  'assets/IMG/dice-4.png',
  'assets/IMG/dice-5.png',
  'assets/IMG/dice-6.png',
];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  String activeDiceImage = diceImages[0];
  
  get randomIndex => null; // Initial image (dice-1)

  void rollDice() {
    setState(() { randomIndex = Random().nextInt(6); 
      activeDiceImage = diceImages[randomIndex];
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));

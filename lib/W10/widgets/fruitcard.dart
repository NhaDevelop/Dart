import 'package:flutter/material.dart';

class FruitCard extends StatelessWidget {
  final String label;
  final Color color;
  final int quantity;

  const FruitCard({
    required this.label,
    required this.color,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: color.withOpacity(0.2),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('Quantity: $quantity'),
          ),
        ),
      ],
    );
  }
}

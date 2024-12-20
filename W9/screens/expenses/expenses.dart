import 'package:flutter/material.dart';

class Fruit {
  final String label;
  final Color color;
  final int quantity;

  Fruit(this.label, this.color, this.quantity);
}

final List<Fruit> fruits = [
  Fruit('Apple', Colors.red, 5),
  Fruit('Banana', Colors.yellow, 7),
  Fruit('Grapes', Colors.purple, 12),
  Fruit('Orange', Colors.orange, 4),
];

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (fruits.isNotEmpty) {
      content = ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Card(
            color: fruit.color.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                fruit.label,
                style: TextStyle(
                  color: fruit.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Quantity: ${fruit.quantity}'),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

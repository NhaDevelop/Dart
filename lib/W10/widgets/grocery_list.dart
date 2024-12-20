import 'package:experiment_app1/W10/widgets/fruitcard.dart';
import 'package:experiment_app1/W10/widgets/new_item.dart';
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
          return FruitCard(
            label: fruit.label,
            color: fruit.color,
            quantity: fruit.quantity,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewItem()),
                ),
             },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

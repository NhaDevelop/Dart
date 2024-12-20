import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

enum Mode { edit, add }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = dummyGroceryItems;

  Future<void> _addItem(BuildContext context) async {
    final newGroceryItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(mode: Mode.add),
      ),
    );

    if (newGroceryItem != null) {
      setState(() {
        _groceryItems.add(newGroceryItem);
      });
    }
  }

  Future<void> _editItem(BuildContext context, GroceryItem item) async {
    final editedGroceryItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => NewItem(mode: Mode.edit, item: item),
      ),
    );

    if (editedGroceryItem != null) {
      setState(() {
        final index = _groceryItems.indexWhere((element) => element.id == editedGroceryItem.id);
        _groceryItems[index] = editedGroceryItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () => _editItem(context, _groceryItems[index]),
          child: GroceryTile(_groceryItems[index]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => _addItem(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
    );
  }
}

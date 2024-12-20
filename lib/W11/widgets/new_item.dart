import 'package:experiment_app1/W11/widgets/grocery_list.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  final Mode mode;
  final GroceryItem? item;

  const NewItem({super.key, required this.mode, this.item});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  int _enteredQuantity = 1;
  GroceryCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.edit && widget.item != null) {
      _enteredName = widget.item!.name;
      _enteredQuantity = widget.item!.quantity;
      _selectedCategory = widget.item!.category;
    }
  }

  void _saveItem() {
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: widget.item?.id ?? const Uuid().v4(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory!,
      );

      Navigator.of(context).pop(newItem);
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    setState(() {
      _enteredName = '';
      _enteredQuantity = 1;
      _selectedCategory = null;
    });
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Select a quantity';
    }
    final quantity = int.tryParse(value);
    if (quantity == null || quantity <= 0) {
      return 'Must be a valid positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == Mode.add ? 'Add a new item' : 'Edit item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                initialValue: _enteredName,
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: _enteredQuantity.toString(),
                      validator: validateQuantity,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text('Save Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

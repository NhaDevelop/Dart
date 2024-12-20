import 'package:uuid/uuid.dart';
import 'grocery_category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final GroceryCategory category;

  GroceryItem({
    String? id,
    required this.name,
    required this.quantity,
    required this.category,
  }) : id = id ?? const Uuid().v4();
}

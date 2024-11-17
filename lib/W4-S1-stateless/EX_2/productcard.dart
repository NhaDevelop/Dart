import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 50, height: 50),  
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum Product {
  dart('assets/IMG/dart.png', 'Dart', 'The best object-oriented language'),
  flutter('assets/IMG/flutter.png', 'Flutter', 'The best mobile widget library'),
  firebase('assets/IMG/firebase.png', 'Firebase', 'The best cloud database');

  final String imageUrl;
  final String title;
  final String description;

  const Product(this.imageUrl, this.title, this.description);
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView(
        children: Product.values.map((product) {
          return ProductCard(
            imageUrl: product.imageUrl,
            title: product.title,
            description: product.description,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ProductList(),
  ));
}

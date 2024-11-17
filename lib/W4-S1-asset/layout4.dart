import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyLayout(),
    ),
  ));
}

class MyLayout extends StatelessWidget {
  const MyLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        Container(
          height: 100,
          color: Colors.blue,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.green,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.pink,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}

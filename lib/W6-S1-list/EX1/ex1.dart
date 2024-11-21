import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Looping Widgets Example')),
        body: const LoopingWidgetsExample(),
      ),
    );
  }
}

class LoopingWidgetsExample extends StatelessWidget {
  const LoopingWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            '1. Integrating the Loop Directly into the List',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const Text("Start"),
             
              for (var i = 0; i < 10; i++) Text('Item $i'), //for loop
              const Text("End"),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '2. Using the map() Method',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const Text("Start"),
           
              ...["red", "blue", "green", "yellow"]
                  .map((item) => Text(item))  //map
                  ,
              const Text("End"),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '3. Using a Dedicated Function',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              const Text("Start"),
              ...getLabels(), //function 
              const Text("End"),
            ],
          ),
        ],
      ),
    );
  }


  List<Widget> getLabels() {
    return ["MON", "TUE", "WED", "THU"]
        .map((item) => Text(item))
        .toList();
  }
}

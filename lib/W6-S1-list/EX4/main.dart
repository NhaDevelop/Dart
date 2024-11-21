import 'package:experiment_app1/W6-S1-list/EX2/ex2.dart';
import 'package:flutter/material.dart';
import 'joke.dart'; //import data
void main() {
  runApp(const MyApp());
}
class JokesListScreen extends StatefulWidget {
  const JokesListScreen({super.key});

  @override
 
 
  _JokesListScreenState createState() => _JokesListScreenState();
}

class _JokesListScreenState extends State<JokesListScreen> {
  int? favoriteIndex; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jokes[index].title),
            subtitle: Text(jokes[index].description),
            trailing: IconButton(
              icon: Icon(
                favoriteIndex == index ? Icons.favorite : Icons.favorite_border,
                color: favoriteIndex == index ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  favoriteIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'model.dart';
import 'dataprofile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfileApp(profileData: profile),
    );
  }
}

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;

  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CADT Student Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profileData.avatarUrl != null
                        ? NetworkImage(profileData.avatarUrl!)
                        : null,
                    child: profileData.avatarUrl == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profileData.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    profileData.position,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            // Profile Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: profileData.titles.map((tile) => _buildTile(tile)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(TileData tile) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(tile.icon, color: Colors.blue),
        title: Text(tile.title),
        subtitle: Text(tile.data),
      ),
    );
  }
}

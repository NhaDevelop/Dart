// data/profile.dart
import 'package:experiment_app1/W6-S1-list/EX2/model.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
final ProfileData profile = ProfileData(
  name: 'Ronan OGOR',
  position: 'Flutter Developer',
  avatarUrl: '', 
  titles: [
    TileData(
      icon: Icons.phone,
      title: 'Phone Number',
      data: '+123 456 7890',
    ),
    TileData(
      icon: Icons.location_on,
      title: 'Address',
      data: 'Cambodia',
    ),
  ],
);

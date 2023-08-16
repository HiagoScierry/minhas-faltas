// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas Materias',
      home: MyHomePage(),
    );
  }
}

class ListItems {}

// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/cart_item.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItemProvider(),
      child: MaterialApp(
        title: 'Minhas Materias',
        home: MyHomePage(),
      ),
    );
  }
}

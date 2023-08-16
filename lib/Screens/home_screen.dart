// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:minhasfaltas/Provider/cart_item.dart';
import 'package:provider/provider.dart';

import '../Components/card_grid.dart';
import '../Components/add_form_dialog.dart';
import '../Components/info_dialog.dart';

import '../Model/card_item.dart';

class MyHomePage extends StatelessWidget {
  List<CardItem> cardItems = [];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    cardItems = Provider.of<CartItemProvider>(context).items;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Suas Matérias'),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const InfoDialog();
                    },
                  );
                },
                icon: const Icon(Icons.info)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AddFormDialog();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: CardGrid(
                cardItems: cardItems,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text('Desenvolvido por : Hiago Moreira',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ));
  }
}

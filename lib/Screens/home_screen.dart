import 'package:flutter/material.dart';

import '../Components/card_grid.dart';
import '../Components/add_form_dialog.dart';

import '../Interfaces/card_item.dart';

class MyHomePage extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(title: 'Vetores e Geometria Analítica', hours: 60),
    CardItem(title: 'Tópicos em Programação 2', hours: 30),
    CardItem(title: 'Segurança e Auditoria de Sistemas', hours: 60),
    CardItem(title: 'Interface Humano Computador', hours: 60),
    CardItem(title: 'Metodologia de Pesquisa', hours: 30),
    CardItem(title: 'Projetos de Sistemas de Software', hours: 60),

    // ... adicione mais itens aqui
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Matérias'),
        actions: [
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
      body: Center(
        child: CardGrid(cardItems: cardItems),
      ),
    );
  }
}

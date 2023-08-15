import 'package:flutter/material.dart';

import 'components/card_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modal Form Example',
      home: MyHomePage(),
    );
  }
}

class ListItems {}

class MyHomePage extends StatelessWidget {
  var content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Form Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Adicionar Materia'),
                    content: AddItemModal(),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: CardGrid(
          cardItems: [
            CardItem(title: 'Vetores e Geometria Analítica', percentage: 20),
            CardItem(title: 'Tópicos em Programação 2', percentage: 30),
            CardItem(
                title: 'Segurança e Auditoria de Sistemas', percentage: 40),
            CardItem(title: 'Interface Humano Computador', percentage: 40),
            CardItem(title: 'Metodologia de Pesquisa', percentage: 40),
            CardItem(title: 'Projetos de Sistemas de Software', percentage: 40),
            // ... adicione mais itens aqui
          ],
        ),
      ),
    );
  }
}

class AddItemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Item',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                Navigator.pop(context); // Close the modal
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

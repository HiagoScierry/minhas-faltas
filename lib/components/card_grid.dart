// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'custom_card.dart';

class CardItem {
  final String title;
  final int percentage;

  CardItem({required this.title, required this.percentage});
}

class CardGrid extends StatelessWidget {
  final List<CardItem> cardItems;

  CardGrid({super.key, required this.cardItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: cardItems.length,
      itemBuilder: (context, index) {
        return CustomCard(
          title: cardItems[index].title,
          percentage: cardItems[index].percentage,
          tapHandle: () {
            // Show the AlertDialog with TextField
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Modal ${index + 1}'),
                  content: CustomModalContent(title: cardItems[index].title),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}

class CustomModalContent extends StatelessWidget {
  final String title;

  CustomModalContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This is the content of the modal.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the modal
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}

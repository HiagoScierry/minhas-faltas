// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Model/card_item.dart';

import 'update_form_dialog.dart';
import 'custom_card.dart';

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
        double percentage =
            (cardItems[index].faults / cardItems[index].hours) * 100;
        return CustomCard(
          title: cardItems[index].title,
          percentage: percentage,
          hours: cardItems[index].hours,
          faults: cardItems[index].faults,
          tapHandle: () {
            // Show the AlertDialog with TextField
            showDialog(
              context: context,
              builder: (context) {
                return UpdateFormDialog(
                  cardItem: cardItems[index],
                );
              },
            );
          },
        );
      },
    );
  }
}

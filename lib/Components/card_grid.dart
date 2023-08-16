// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../Interfaces/card_item.dart';
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
        return CustomCard(
          title: cardItems[index].title,
          percentage: cardItems[index].hours,
          tapHandle: () {
            // Show the AlertDialog with TextField
            showDialog(
              context: context,
              builder: (context) {
                return CustomModalContent(
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

class CustomModalContent extends StatefulWidget {
  final CardItem cardItem;

  CustomModalContent({super.key, required this.cardItem});

  @override
  _CustomModalContentState createState() => _CustomModalContentState();
}

class _CustomModalContentState extends State<CustomModalContent> {
  int currentAbsences = 0;

  @override
  void initState() {
    super.initState();
    currentAbsences = widget.cardItem.hours ~/ 10;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.cardItem.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Faltas Anteriores: ${widget.cardItem.hours ~/ 10}'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                onPressed: () {
                  setState(() {
                    if (currentAbsences > 0) {
                      currentAbsences--;
                    }
                  });
                },
                child: Icon(Icons.remove),
              ),
              SizedBox(width: 16),
              Text('$currentAbsences', style: TextStyle(fontSize: 20)),
              SizedBox(width: 16),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                ),
                onPressed: () {
                  setState(() {
                    currentAbsences++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Implement actions here, e.g., save the current absences
            Navigator.pop(context);
          },
          child: Text('Salvar'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Text('Cancelar'))
      ],
    );
  }
}

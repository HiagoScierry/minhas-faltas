// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../Model/card_item.dart';

class UpdateFormDialog extends StatefulWidget {
  final CardItem cardItem;

  const UpdateFormDialog({super.key, required this.cardItem});

  @override
  _UpdateFormDialogState createState() => _UpdateFormDialogState();
}

class _UpdateFormDialogState extends State<UpdateFormDialog> {
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                onPressed: () {
                  setState(() {
                    if (currentAbsences > 0) {
                      currentAbsences--;
                    }
                  });
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 16),
              Text('$currentAbsences', style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                onPressed: () {
                  setState(() {
                    currentAbsences++;
                  });
                },
                child: const Icon(Icons.add),
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
          child: const Text('Salvar'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Cancelar'))
      ],
    );
  }
}

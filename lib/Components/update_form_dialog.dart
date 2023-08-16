// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:minhasfaltas/Provider/cart_item.dart';
import 'package:provider/provider.dart';

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
    currentAbsences = widget.cardItem.faults;
  }

  @override
  Widget build(BuildContext context) {
    var cartItemProvider = Provider.of<CartItemProvider>(context);

    return AlertDialog(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Atualizar Faltas'),
          IconButton(
              onPressed: () {
                cartItemProvider.removeItem(widget.cardItem);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Disciplina: ${widget.cardItem.title}'),
          Text('Qtd : ${widget.cardItem.faults}'),
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
            cartItemProvider.updateItem(widget.cardItem, currentAbsences);
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

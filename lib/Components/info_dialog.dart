import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
        title: Text('Informações'),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Preste atenção a sua porcentagem de faltas, se suas faltas tiverem uma porcentagem acima de 25% você é reprovado por falta.',
            style: TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 10),
        ]));
  }
}

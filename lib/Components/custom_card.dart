import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final double percentage;
  final VoidCallback tapHandle;

  const CustomCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.tapHandle,
  });

  @override
  Widget build(BuildContext context) {
    int percent = percentage.toInt();
    return GestureDetector(
        onTap: tapHandle,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8)), // Define se a borda é arredondada
          child: Container(
            width: 500, // Define a largura do card
            height: 250, // Define a altura do card
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

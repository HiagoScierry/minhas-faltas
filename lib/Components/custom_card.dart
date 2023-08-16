import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final double percentage;
  final VoidCallback tapHandle;
  final int hours;
  final int faults;

  const CustomCard({
    super.key,
    required this.title,
    required this.percentage,
    required this.hours,
    required this.faults,
    required this.tapHandle,
  });

  @override
  Widget build(BuildContext context) {
    int percent = percentage > 0 ? percentage.toInt() : 0;
    int qtdMaxFaults = (hours * 0.25).toInt();
    return GestureDetector(
        onTap: tapHandle,
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(8),
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
                const SizedBox(height: 10),
                Text("C. Horaria : $hours hrs"),
                const SizedBox(height: 10),
                Text("Max de Faltas : $faults/$qtdMaxFaults"),
                const SizedBox(height: 20),
                Text(percent > 25 ? "Consulte o professor" : "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("$percent%",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: (percent > 25) ? Colors.red : Colors.green,
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

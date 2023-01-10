import 'package:flutter/material.dart';

class Barra extends StatelessWidget {
  final String dia;
  final double valor;
  final double percentual;

  const Barra(
      {super.key,
      required this.dia,
      required this.valor,
      required this.percentual});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text("R\$${valor.toStringAsFixed(2)}")),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(220, 220, 220, 1),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              FractionallySizedBox(
                heightFactor: percentual,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(dia),
      ],
    );
  }
}

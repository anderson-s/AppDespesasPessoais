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
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: [
            SizedBox(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text("R\$${valor.toStringAsFixed(2)}"),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.05,
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
              height: constraint.maxHeight * 0.6,
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
            SizedBox(
              height: constraint.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  dia,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

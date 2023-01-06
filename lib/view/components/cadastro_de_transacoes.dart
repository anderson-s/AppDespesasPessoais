import 'package:flutter/material.dart';

class CadastroTransacoes extends StatelessWidget {
  final controllerTitulo = TextEditingController();
  final controllerValor = TextEditingController();
  final Function(String, double) cadastrar;
  CadastroTransacoes({super.key, required this.cadastrar});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: controllerTitulo,
              decoration: const InputDecoration(
                labelText: "Titulo",
              ),
            ),
            TextField(
              controller: controllerValor,
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    cadastrar(controllerTitulo.text,
                        double.tryParse(controllerValor.text) ?? 0.0);
                  },
                  child: const Text(
                    "Nova Transação",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

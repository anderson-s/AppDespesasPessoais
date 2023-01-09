import 'package:flutter/material.dart';

class CadastroTransacoes extends StatefulWidget {
  final Function(String, double) cadastrar;
  
  const CadastroTransacoes({super.key, required this.cadastrar});

  @override
  State<CadastroTransacoes> createState() => _CadastroTransacoesState();
}

class _CadastroTransacoesState extends State<CadastroTransacoes> {
  final controllerTitulo = TextEditingController();

  final controllerValor = TextEditingController();

  _enviarFormulario() {
    String titulo = controllerTitulo.text;
    double valor = double.tryParse(controllerValor.text) ?? 0.0;
    if (titulo.isEmpty || valor <= 0.0) {
      return;
    } else {
      widget.cadastrar(titulo, valor);
    }
  }

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
              onSubmitted: (value) => _enviarFormulario(),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Valor (R\$)",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _enviarFormulario,
                  child: const Text(
                    "Nova Transação",
                    style: TextStyle(
                      color: Colors.purple,
                    ),
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

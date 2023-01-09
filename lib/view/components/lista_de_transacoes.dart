import 'package:despesas_pessoais/model/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListasTransacoes extends StatelessWidget {
  final List<Transacao> listaTransacoes;
  const ListasTransacoes({super.key, required this.listaTransacoes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: listaTransacoes.length,
        itemBuilder: (context, index) {
          var e = listaTransacoes[index];
          return Card(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "R\$ ${e.valor.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.titulo,
                        style: Theme.of(context).textTheme.headline6),
                    Text(
                      DateFormat("d MMM y").format(e.data),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

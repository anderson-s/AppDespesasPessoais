import 'package:despesas_pessoais/model/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListasTransacoes extends StatelessWidget {
  final List<Transacao> listaTransacoes;
  const ListasTransacoes({super.key, required this.listaTransacoes});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              ...listaTransacoes
                  .map(
                    (e) => Card(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            )),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              "R\$ ${e.valor.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.id,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                DateFormat("d MMM y").format(e.data),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          );
  }
}

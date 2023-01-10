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
      child: listaTransacoes.isEmpty
          ? Column(
              children: [
                Text(
                  "Nenhuma Transação Cadastrada!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: listaTransacoes.length,
              itemBuilder: (context, index) {
                var e = listaTransacoes[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text(
                            "R\$${e.valor}",
                            style: const TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      e.titulo,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat("dd MMM y").format(
                        e.data,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:despesas_pessoais/model/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();
  final _valorController = TextEditingController();
  final _transacoes = [
    Transacao(
      id: "t1",
      titulo: "Transacao 1",
      valor: 200.00,
      data: DateTime.now(),
    ),
    Transacao(
      id: "t2",
      titulo: "Transacao 2",
      valor: 100.00,
      data: DateTime.now(),
    ),
    Transacao(
      id: "t3",
      titulo: "Transacao 3",
      valor: 150.00,
      data: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //Ocupa a largura inteira
        children: [
          const SizedBox(
            child: Card(
              color: Colors.red,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          Column(
            children: [
              ..._transacoes
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
                                e.titulo,
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
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Titulo",
                    ),
                  ),
                   TextField(
                    controller: _valorController,
                    decoration: const InputDecoration(
                      labelText: "Valor (R\$)",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print(_controller.text);
                          print(_valorController.text);
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
          )
        ],
      ),
    );
  }
}

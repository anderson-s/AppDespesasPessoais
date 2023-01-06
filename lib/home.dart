import 'package:despesas_pessoais/model/transacao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(children: [
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
                          e.valor.toString(),
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
                            e.data.toString(),
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      )
                    ],
                  )),
                )
                .toList(),
          ]),
        ],
      ),
    );
  }
}

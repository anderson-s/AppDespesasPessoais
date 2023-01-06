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
        children: const [
          SizedBox(
            child: Card(
              color: Colors.red,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          Card(
            child: Text("Lista"),
          )
        ],
      ),
    );
  }
}

import 'package:despesas_pessoais/model/transacao.dart';
import 'package:despesas_pessoais/view/components/cadastro_de_transacoes.dart';
import 'package:despesas_pessoais/view/components/lista_de_transacoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transacao> transacoes = [
    // Transacao(
    //   id: "t1",
    //   titulo: "Transacao 1",
    //   valor: 200.00,
    //   data: DateTime.now(),
    // ),
  ];

  _abrirModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CadastroTransacoes(cadastrar: adicionar);
      },
    );
  }

  adicionar(String titulo, double valor) {
    final novaTransacao = Transacao(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        titulo: titulo,
        valor: valor,
        data: DateTime.now());
    setState(() {
      transacoes.add(novaTransacao);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Despesas Pessoais"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _abrirModalForm(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                ListasTransacoes(listaTransacoes: transacoes),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _abrirModalForm(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

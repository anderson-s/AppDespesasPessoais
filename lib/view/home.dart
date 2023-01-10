import 'package:despesas_pessoais/model/transacao.dart';
import 'package:despesas_pessoais/view/components/cadastro_de_transacoes.dart';
import 'package:despesas_pessoais/view/components/grafico.dart';
import 'package:despesas_pessoais/view/components/lista_de_transacoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transacao> transacoes = [
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now()),
    Transacao(id: "id", titulo: "titulo", valor: 500.00, data: DateTime.now())
  ];

  List<Transacao> _transacoesRecentes() {
    return transacoes.where((element) {
      return element.data
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _abrirModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return CadastroTransacoes(cadastrar: adicionar);
      },
    );
  }

  adicionar(String titulo, double valor, DateTime data) {
    final novaTransacao = Transacao(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        titulo: titulo,
        valor: valor,
        data: data);
    setState(() {
      transacoes.add(novaTransacao);
    });
    Navigator.pop(context);
  }

  deletar(String id) {
    setState(() {
      transacoes.removeWhere((element) => element.id == id);
    });
    // Navigator.pop(context);
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
            Grafico(
              transacoesRecentes: _transacoesRecentes(),
            ),
            Column(
              children: [
                ListasTransacoes(listaTransacoes: transacoes, remover: deletar),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            _abrirModalForm(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

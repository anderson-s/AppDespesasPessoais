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
  bool mostrarGrafico = false;

  List<Transacao> transacoes = [];

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
    final mediaQuery = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    bool modoPaisagem =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final actions = [
      if (modoPaisagem)
        IconButton(
          icon: Icon(mostrarGrafico ? Icons.list : Icons.show_chart),
          onPressed: () {
            setState(() {
              mostrarGrafico = !mostrarGrafico;
            });
          },
        ),
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          _abrirModalForm(context);
        },
      ),
    ];
    final corpo = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //Ocupa a largura inteira
          children: [
            if (mostrarGrafico || !modoPaisagem)
              SizedBox(
                height: modoPaisagem ? mediaQuery * 0.8 : mediaQuery * 0.3,
                child: Grafico(
                  transacoesRecentes: _transacoesRecentes(),
                ),
              ),
            if (!mostrarGrafico || !modoPaisagem)
              SizedBox(
                height: mediaQuery * (modoPaisagem ? 1 : 0.7),
                child: ListasTransacoes(
                  listaTransacoes: transacoes,
                  remover: deletar,
                ),
              ),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Despesas Pessoais",
          style: TextStyle(
            fontSize: 20 * MediaQuery.of(context).textScaleFactor,
          ),
        ),
        centerTitle: true,
        actions: actions,
      ),
      body: corpo,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            _abrirModalForm(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

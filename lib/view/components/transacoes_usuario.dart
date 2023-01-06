import 'package:despesas_pessoais/model/transacao.dart';
import 'package:despesas_pessoais/view/components/cadastro_de_transacoes.dart';
import 'package:despesas_pessoais/view/components/lista_de_transacoes.dart';
import 'package:flutter/material.dart';

class TransacoesUsuario extends StatefulWidget {
  const TransacoesUsuario({super.key});

  @override
  State<TransacoesUsuario> createState() => _TransacoesUsuarioState();
}

class _TransacoesUsuarioState extends State<TransacoesUsuario> {
  var transacoes = [
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

  adicionar(String titulo, double valor) {
    final novaTransacao =
        Transacao(id: DateTime.now().microsecondsSinceEpoch.toString(), titulo: titulo, valor: valor, data: DateTime.now());
    setState(() {
      transacoes.add(novaTransacao);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListasTransacoes(listaTransacoes: transacoes),
        CadastroTransacoes(cadastrar: adicionar),
      ],
    );
  }
}

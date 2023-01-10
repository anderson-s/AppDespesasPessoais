import 'package:despesas_pessoais/model/transacao.dart';
import 'package:despesas_pessoais/view/components/barra.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Grafico extends StatelessWidget {
  final List<Transacao> transacoesRecentes;
  const Grafico({super.key, required this.transacoesRecentes});

  List<Map<String, Object>> pegarTransacoes() {
    return List.generate(7, (index) {
      final diaSemana = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < transacoesRecentes.length; i++) {
        bool mesmoDia = transacoesRecentes[i].data.day == diaSemana.day;
        bool mesmoMes = transacoesRecentes[i].data.month == diaSemana.month;
        bool mesmoAno = transacoesRecentes[i].data.year == diaSemana.year;

        if (mesmoDia && mesmoMes && mesmoAno) {
          totalSum += transacoesRecentes[i].valor;
        }
      }
      return {
        "dia": DateFormat.E().format(diaSemana)[0],
        "valor": totalSum,
      };
    }).reversed.toList();
  }

  double get pegarPercentual {
    return pegarTransacoes().fold(
        0.0,
        (previousValue, element) =>
            previousValue + double.parse(element["valor"].toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: pegarTransacoes()
              .map(
                (e) => Flexible(
                  fit: FlexFit.tight,
                  child: Barra(
                      dia: e["dia"].toString(),
                      valor: double.parse(e["valor"].toString()),
                      percentual:
                          double.parse(e["valor"].toString()) / pegarPercentual),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

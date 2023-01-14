import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroTransacoes extends StatefulWidget {
  final Function(String, double, DateTime) cadastrar;

  const CadastroTransacoes({super.key, required this.cadastrar});

  @override
  State<CadastroTransacoes> createState() => _CadastroTransacoesState();
}

class _CadastroTransacoesState extends State<CadastroTransacoes> {
  final controllerTitulo = TextEditingController();
  final controllerValor = TextEditingController();
  DateTime dataSelecionada = DateTime.now();
  _enviarFormulario() {
    String titulo = controllerTitulo.text;
    double valor = double.tryParse(controllerValor.text) ?? 0.0;
    if (titulo.isEmpty || valor <= 0.0) {
      return;
    } else {
      widget.cadastrar(titulo, valor, dataSelecionada);
    }
  }

  _abrirDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          dataSelecionada = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: controllerTitulo,
                decoration: const InputDecoration(
                  labelText: "Titulo",
                ),
              ),
              TextField(
                controller: controllerValor,
                onSubmitted: (value) => _enviarFormulario(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: "Valor (R\$)",
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Data Selecionada: ${DateFormat("dd/MM/y").format(dataSelecionada)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _abrirDatePicker();
                      },
                      child: const Text("Selecionar Data"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(
                          16,
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: _enviarFormulario,
                    child: const Text(
                      "Nova Transação",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

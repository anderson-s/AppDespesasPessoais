import 'package:despesas_pessoais/view/components/transacoes_usuario.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        children: const [
          SizedBox(
            child: Card(
              color: Colors.red,
              elevation: 5,
              child: Text("Gráfico"),
            ),
          ),
          TransacoesUsuario()
        ],
      ),
    );
  }
}

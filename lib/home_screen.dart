import 'package:flutter/material.dart';
//import 'package:myapp/result.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void calcula() {
    double peso = double.parse(widget.pesoController.text);
    double altura = double.parse(widget.alturaController.text);
    double imc = peso / (altura * altura);
    String message = 'Aguardando Calculo!';

    if (imc < 18.5) {
      message = 'Resultado: Magro';
    } else if (imc < 24.9) {
      message = 'Resultado: Normal';
    } else if (imc < 29.9) {
      message = 'Resultado: Sobrepeso';
    } else if (imc < 34.9) {
      message = 'Resultado: Obesidade grau I';
    } else if (imc < 39.9) {
      message = 'Resultado: Obesidade grau II';
    } else {
      message = 'Resultado: Obesidade grau III';
    }
    message = 'Seu IMC: ${imc.toStringAsFixed(2)}.  $message';

    Navigator.pushNamed(
      context,
      "/result",
      arguments: {"resultado": message}   
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Cálculo IMC'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: widget.pesoController,
                decoration: const InputDecoration(
                  labelText: 'Informe seu peso',
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: widget.alturaController,
                decoration: const InputDecoration(
                  labelText: 'Informe sua Altura',
                  border: OutlineInputBorder(),
                ),
              ),
              OutlinedButton(
                onPressed: calcula,
                child: Text("Calcular"),
              ),
            ],
          ),
        )
      );
  }
}

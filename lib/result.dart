import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result({super.key});

  late String message;

  @override
  Widget build(BuildContext context) {
    message = (ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>)['resultado'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado'),
        ),
        body: Center(
          child: Text(message),
        ));
  }
}

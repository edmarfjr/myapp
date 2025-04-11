import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String message;

  const Result({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultado'),
        ),
        body: Center(
          child: Text(message),
        ),);
  }
}

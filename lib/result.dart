import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({super.key});

  late String message;

  @override
  Widget build(BuildContext context) {
    message = (ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>)["resultado"];

    return Scaffold(
        appBar: AppBar(
          title: Text('Resultado'),
        ),
        body: Center(
          child: Text(message),
        ));
  }
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';
import 'package:myapp/home_screen.dart';
import 'package:myapp/result.dart';

void main() {
  testWidgets('App starts correctly and shows HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify that HomeScreen is displayed
    expect(find.byType(HomeScreen), findsOneWidget);

    expect(find.text('Informe seu peso'), findsOneWidget);
    expect(find.text('Informe sua Altura'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
  });
  testWidgets('HomeScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Informe seu peso'), findsOneWidget);
    expect(find.text('Informe sua Altura'), findsOneWidget);
    expect(find.text('Calcular'), findsOneWidget);
  });

  testWidgets('Result is shown correctly after calculation',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/result': (context) => Result(),
      },
    ));

    // Enter values in the text fields
    await tester.enterText(find.byType(TextFormField).at(0), '70');
    await tester.enterText(find.byType(TextFormField).at(1), '1.68');

    // Tap the 'Calcular' button
    await tester.tap(find.text('Calcular'));
    await tester.pumpAndSettle();

    // Verify the result message
    expect(find.text('Seu IMC: 24.80.  Resultado: Normal'), findsOneWidget);
  });
}

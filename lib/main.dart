import 'package:calculator_provider/models/calculator_provider.dart';
import 'package:calculator_provider/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorValue>(
      create: (context) => CalculatorValue(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Calculator(),
      ),
    );
  }
}

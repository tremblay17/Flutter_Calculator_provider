import 'package:flutter/material.dart';
import 'package:calculator_provider/models/calculator_provider.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final formKey = new GlobalKey<FormState>();

  late TextEditingController _displayStringCon1;
  late TextEditingController _displayStringCon2;

  @override
  void initState() {
    super.initState();
    _displayStringCon1 = TextEditingController();
    _displayStringCon2 = TextEditingController();
  }

  @override
  void dispose() {
    _displayStringCon1 = TextEditingController();
    _displayStringCon2 = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 40.0,
                        width: 50.0,
                        child: TextFormField(
                          controller: _displayStringCon1,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 60.0,
                        width: 50.0,
                        child: Consumer<CalculatorValue>(
                          builder: (context, newCalculator, child) =>
                              DropdownButton<String>(
                            value: newCalculator.operation,
                            items: Provider.of<CalculatorValue>(context,
                                    listen: true)
                                .operators
                                .map<DropdownMenuItem<String>>(
                                    (String operation) {
                              return DropdownMenuItem<String>(
                                value: operation,
                                child: Text(
                                  operation,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newoperation) {
                              Provider.of<CalculatorValue>(context,
                                      listen: false)
                                  .setoperation(newoperation!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 40.0,
                        width: 50.0,
                        child: TextFormField(
                          controller: _displayStringCon2,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60.0,
                  width: 80.0,
                  child: Text(
                    Provider.of<CalculatorValue>(context, listen: true)
                        .result
                        .toString(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    onPressed: () {
                      Provider.of<CalculatorValue>(context, listen: false)
                          .num1 = _displayStringCon1.text;
                      Provider.of<CalculatorValue>(context, listen: false)
                          .num2 = _displayStringCon2.text;
                      Provider.of<CalculatorValue>(context, listen: false)
                          .calculateValue();
                      _displayStringCon1.clear();
                      _displayStringCon2.clear();
                    },
                    child: Text('Calculate')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

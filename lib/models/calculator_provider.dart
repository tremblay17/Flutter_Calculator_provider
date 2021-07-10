import 'dart:ffi';

import 'package:flutter/material.dart';

class CalculatorValue with ChangeNotifier {
  String _num1 = '0.0';
  String get num1 => _num1;
  set num1(String num1) {
    _num1 = num1;
    notifyListeners();
  }

  String _num2 = '0.0';
  String get num2 => _num2;
  set num2(String num2) {
    _num2 = num2;
    notifyListeners();
  }

  String _resultS = '0.0';
  String get resultS => _resultS;
  set resultS(String resultS) {
    _resultS = resultS;
    notifyListeners();
  }

  double _result = 0.0;
  double get result => _result;
  set result(double result) {
    _result = result;
    notifyListeners();
  }

  List<String> _operation = ['+', '-', '*', '/'];
  String _selection = '+';
  List<String> get operators => _operation;
  String get operation => _selection;
  void setoperation(String operation) {
    _selection = operation;
    notifyListeners();
  }

  double temp = 0.0;

  void calculateValue() {
    temp = double.parse(_num1);
    switch (_selection) {
      case '+':
        temp += double.parse(_num2);
        _result = temp;
        break;
      case '-':
        temp -= double.parse(_num2);
        _result = temp;
        break;
      case '*':
        temp *= double.parse(_num2);
        _result = temp;
        break;
      case '/':
        temp /= double.parse(_num2);
        _result = temp;
        break;
      default:
        break;
    }
    _resultS = _result.toString();
    notifyListeners();
  }
}

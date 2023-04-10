import 'package:calculate/Calculate/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateCubit extends Cubit<CalculatorStates> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  TextEditingController opController = TextEditingController();

  double? result;

  CalculateCubit():super(InitialState());

  static CalculateCubit getObject(context){
    return BlocProvider.of(context);
  }

  void calculateCubit() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    String op = opController.text;
    switch (op) {
      case '*':
        result = num1 * num2;
        break;
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        result = null;
    }
    emit(ResultState());
  }
}

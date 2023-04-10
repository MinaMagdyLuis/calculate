import 'package:calculate/Calculate/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller.dart';

class CalculatePage extends StatelessWidget {
  CalculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<CalculateCubit>(
      create: (context) => CalculateCubit(),
      child: Builder(
        builder: (context)
         {
           final cubit=CalculateCubit();

           return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: cubit.num1Controller,
                  decoration: InputDecoration(
                    labelText: 'Enter first number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cubit.opController,
                  decoration: InputDecoration(
                    labelText: 'Enter operation ',
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: cubit.num2Controller,
                  decoration: InputDecoration(
                    labelText: 'Enter second number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                StatefulBuilder(
                  builder: (context, setState) => Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          cubit.calculateCubit();
                          setState(() {});
                        },
                        child: Text(
                          'Calculate',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CalculateCubit,CalculatorStates>(builder: (context, state) => Text(
                          cubit.result.toString(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );},
      ),
    );
  }
}

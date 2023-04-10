import 'package:calculate/counter/cubit.dart';
import 'package:calculate/counter/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Counter',
        ),
      ),
      body: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: Builder(
          builder: (context) {
            final cubit = CounterCubit.getObject(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        cubit.plus();
                      },
                      child: Icon(Icons.add),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    BlocBuilder<CounterCubit, CounterStates>(
                      builder: (context, state) => Text(
                       ' ${cubit.count}',
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        cubit.minus();
                      },
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

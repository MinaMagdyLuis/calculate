

import 'package:calculate/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{

  int count=0;


  CounterCubit():super(CounterInitialState());


  static CounterCubit getObject(context)=> BlocProvider.of(context);
  void plus(){
    count++;
    emit( CounterPlusState());

  }

  void minus(){
    count--;
    emit( CounterMinusState());

  }


}
import 'package:bloccounterapp/modules/counter/cubit/counter_cubit.dart';
import 'package:bloccounterapp/modules/counter/views/counter_view.dart';
import 'package:bloccounterapp/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approutes {
  static Map<String, Widget Function(BuildContext)> myroutes() {
    return {
      '/': (context) => const Home(),
      '/counter': (context) => BlocProvider.value(
            value: CounterCubit(),
            child: const Counters(),
          ),
    };
  }
}

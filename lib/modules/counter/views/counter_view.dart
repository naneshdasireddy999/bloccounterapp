import 'package:bloccounterapp/modules/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counters extends StatefulWidget {
  const Counters({Key? key}) : super(key: key);

  @override
  State<Counters> createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  var x = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CounterCubit>();
    if (x == true) {
      cubit.fetchcount();
      x = false;
    }

    return BlocListener(
      bloc: cubit,
      listener: (context, state) {
        if (state is Counteroverloaded) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('warning'),
                  content: const Text(
                      'counter dangerously high consider resetting it'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('ok'))
                  ],
                );
              });
        }
      },
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.changecompletion(cubit.mycount);
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.resetcount(cubit.mycount);
                  },
                  icon: const Icon(Icons.refresh))
            ],
            title: const Text('CounterView'),
            centerTitle: true,
          ),
          body: cubit.state is CounterInitial
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                    cubit.mycount.count.toString(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                )),
    );
  }
}

part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class Counterloaded extends CounterState {}

class Counteroverloaded extends CounterState {}

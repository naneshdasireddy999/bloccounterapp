import 'package:bloc/bloc.dart';
import 'package:bloccounterapp/data/models/counter_model.dart';
import 'package:bloccounterapp/data/services/remote_services.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  var mycount = Counter(count: 0);
  Future<void> fetchcount() async {
    print('sull');
    var ncount = await RemoteServices.fetchcount();
    if (ncount != null) {
      mycount = ncount;

      emit(Counterloaded());
    }
  }

  Future<void> changecompletion(Counter c) async {
    if (c.count >= 6) {
      emit(Counteroverloaded());
      var mytodo = await RemoteServices.patchcount(c);
      await fetchcount();
    } else {
      emit(Counterloaded());
      var mytodo = await RemoteServices.patchcount(c);
      await fetchcount();
    }
  }

  Future<void> resetcount(Counter c) async {
    var mytodo = await RemoteServices.resetcount(c);
    fetchcount();
  }
}

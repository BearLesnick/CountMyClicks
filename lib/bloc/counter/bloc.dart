import 'dart:async';

import 'package:how_do_i_do/bloc/counter/facade.dart';
import 'package:how_do_i_do/disposable.dart';

class CounterBloc implements Disposable {
  final StreamController<CounterState> _stateSC = StreamController();
  CounterState _state;
  final CounterBlocFacade _facade;
  final StreamController<Event> _eventSC = StreamController();

  Stream<CounterState> get stateStream => _stateSC.stream;

  CounterBloc(this._facade) {
    _eventSC.stream.listen((Event event) {
      _state = event.reduce(_state);
      _stateSC.sink.add(_state);
    });
    _eventSC.sink.add(LoadInitialCount(_facade.getCount, _eventSC.sink));
  }

  void incrementCounter() {
    _eventSC.add(IncrementEvent());
  }

  @override
  void dispose() {
    _stateSC?.close();
    _eventSC?.close();
  }
}

abstract class Event<T> {
  T reduce(T oldState);
}

class IncrementEvent implements Event<CounterState> {
  @override
  CounterState reduce(CounterState oldState) =>
      CounterState(oldState.clickCount + 1);
}

class LoadInitialCount implements Event<CounterState> {
  final Future<int> Function() _loadInitialCount;
  final Sink<Event> _eventSink;

  LoadInitialCount(this._loadInitialCount, this._eventSink);

  @override
  CounterState reduce(CounterState oldState) {
    _loadInitialCount()
        .then((int count) => _eventSink.add(InitialCountFetchedEvent(count)))
        .catchError((_) => _eventSink.add(InitialCountFetchedEvent(0)));
    return CounterState(null);
  }
}

class InitialCountFetchedEvent implements Event<CounterState> {
  final int count;

  InitialCountFetchedEvent(this.count);

  @override
  CounterState reduce(CounterState oldState) {
    return CounterState(count);
  }
}

class CounterState {
  final int clickCount;

  CounterState(this.clickCount);
}

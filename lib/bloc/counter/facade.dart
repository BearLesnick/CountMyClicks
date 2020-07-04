import 'package:how_do_i_do/domain/counter/service.dart';

class CounterBlocFacade {

  final CounterRepository _counterRepository;

  CounterBlocFacade(this._counterRepository);

  Future<int> getCount()=> _counterRepository.getCount();
  Future<void> setCount(int count)=> _counterRepository.setCount(count);

}
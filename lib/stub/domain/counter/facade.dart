import 'package:how_do_i_do/domain/counter/service.dart';

class StubCounterRepository implements CounterRepository {
  @override
  Future<int> getCount() async {
    return 5;
  }

  @override
  Future<void> setCount(int count) async {
    return;
  }
}

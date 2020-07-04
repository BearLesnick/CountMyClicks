abstract class CounterRepository{

  Future<int> getCount();

  Future<void> setCount(int count);

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:how_do_i_do/domain/counter/service.dart';

class FireBaseCounterRepository implements CounterRepository {
  final Firestore _fireStore = Firestore.instance;

  @override
  Future<int> getCount() {
    Firestore.instance.collection('baby').snapshots();
    print(Firestore.instance.collection('baby').snapshots());
    // TODO: implement getCount
    throw UnimplementedError();
  }

  @override
  Future<void> setCount(int count) {
    // TODO: implement setCount
    throw UnimplementedError();
  }

}
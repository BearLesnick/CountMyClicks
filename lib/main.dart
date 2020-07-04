import 'package:flutter/material.dart';
import 'package:how_do_i_do/domain/counter/service.dart';
import 'package:how_do_i_do/home_page.dart';
import 'package:how_do_i_do/stub/domain/counter/facade.dart';
import 'package:how_do_i_do/stub/domain/counter/firebase_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<CounterRepository>.value(value: FireBaseCounterRepository()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(
            title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

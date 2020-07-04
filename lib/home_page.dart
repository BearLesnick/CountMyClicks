import 'package:flutter/material.dart';
import 'package:how_do_i_do/bloc/counter/bloc.dart';
import 'package:how_do_i_do/bloc/counter/facade.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    @required this.title,
    Key key,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc pageBloc;

  @override
  void didChangeDependencies() {
    pageBloc ??=
        CounterBloc(CounterBlocFacade(Provider.of(context, listen: false)));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<CounterState>(
              stream: pageBloc.stateStream,
                builder: (BuildContext context,
                        AsyncSnapshot<CounterState> snapshot) {
                  if(snapshot.hasData)
                  {
                    return Text(
                      snapshot.data.clickCount.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }
                    ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pageBloc.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

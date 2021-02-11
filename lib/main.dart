import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CounterBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: BlocProvider(
            builder: (BuildContext context) => CounterBloc(),
            child: CounterScreen()

        ),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //to refer counter bloc in counter screen
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state){
            return Text('Counter value: $state', style: TextStyle(fontSize: 30),);
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text('increment'),
                  onPressed: () {
                  _counterBloc.add(CounterEvents.increment);
                  }),
              RaisedButton(
                  child: Text('decrement'),
                  onPressed: () {
                  _counterBloc.add(CounterEvents.decrement);
                  })
            ],
          )
        ],
      ),
    );
  }

}
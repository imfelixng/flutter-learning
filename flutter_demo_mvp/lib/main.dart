import 'package:flutter/material.dart';

import 'counter/counter_presenter.dart';
import 'counter/counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> implements CounterView {

  int counter = 0;

  CounterPresenter presenter;

  _CounterState() {
    presenter = new CounterPresenter();
    presenter.attachView(this);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (presenter != null) {
      presenter.deAttachView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo MVP'),
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  presenter.decrement();
                },
                child: Text(
                    '-',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
                ),
              ),
              Text(
                '$counter',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
              ),
              RaisedButton(
                onPressed: (){
                  presenter.increment();
                },
                child: Text(
                  '+',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDecrement(int value) {
    setState(() {
      counter = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      counter = value;
    });
  }
}

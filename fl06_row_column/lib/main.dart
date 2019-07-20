import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 120,
                height: 120,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.amberAccent,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.green,
              )
            ],
          ),
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

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
            child: Container(
              width: 300,
              height: 300,
              alignment: AlignmentDirectional
                  .center, // Căn chỉnh vị trí same justifyContent,...
              // padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              transform: Matrix4.rotationZ(pi / 6),
              decoration: BoxDecoration(
                  color: Colors.green, // Do conflict with color của container
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2, color: Colors.amber[300], style: BorderStyle.solid
                  )
              ),
              child: new Text(
                "Hello App",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          )),
    );
  }
}

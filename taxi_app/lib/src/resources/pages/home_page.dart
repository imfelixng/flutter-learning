import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            AppBar(
              centerTitle: true,
              title: Text("iCab"),
            ),
            
          ],
        ),
      ),
    );
  }
}
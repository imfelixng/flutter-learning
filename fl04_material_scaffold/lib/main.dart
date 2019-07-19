import 'package:flutter/material.dart';

void main() {
  runApp(MaterialExample());
}

class MaterialExample extends StatefulWidget {
  MaterialExample({Key key}) : super(key: key);

  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<MaterialExample> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.yellow
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          body: Center(
              child: Text("This home screen",
                  style: TextStyle(color: Colors.deepOrange, fontSize: 24))),
        ));
  }
}

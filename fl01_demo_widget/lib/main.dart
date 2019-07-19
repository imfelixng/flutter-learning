import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String str = "Text from MyApp";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _width = 50;
  double _height = 50;
  GlobalKey textKey = new GlobalKey();
  GlobalKey buttonKey = new GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter+=5;
      _width+=10;
      _height+=10;
    });

    RenderBox renderText = textKey.currentContext.findRenderObject();
    RenderBox renderButton = buttonKey.currentContext.findRenderObject();
    print(renderText.localToGlobal(Offset.zero));
    print(renderText.size);
    print("==========");
    print(renderButton.localToGlobal(Offset.zero));
    print(renderButton.size);
    MyApp myApp = buttonKey.currentContext.ancestorWidgetOfExactType(MyApp);
    print("=========");
    print(myApp.str);
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
            Text(
              '$_counter',
              key: textKey,
              style: Theme.of(context).textTheme.display1,
            ),
            Container(
              color: Colors.red,
              width: _width,
              height: _height,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        key: buttonKey,
        tooltip: 'Increment',
        child: Icon(Icons.add_a_photo),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth0/flutter_auth0.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Login'),
              color: Colors.green,
              onPressed: () async{
                try {
                  var response = await Auth0(
                      baseUrl: 'https://ngquangan.auth0.com/', clientId: 'RGP1KjwliD6KWXLkR4spitMZzg8O1zj4'
                  ).webAuth.authorize({
                    'audience': 'https://ngquangan.auth0.com/userinfo',
                    'scope': 'openid email offline_access',
                  });

                  print(response);
                } catch (e) {
                  print('Error: $e');
                }
              },
            ),
            FlatButton(
              child: Text('Logout'),
              color: Colors.red,
              onPressed: () async{
                try {
                  await Auth0(
                      baseUrl: 'https://ngquangan.auth0.com/', clientId: 'RGP1KjwliD6KWXLkR4spitMZzg8O1zj4'
                  ).webAuth.clearSession();
                } catch (e) {
                  print('Error: $e');
                }
              },
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

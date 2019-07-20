import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _onSignIn() {
    print("Clicked");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffd8d8d8d8)),
                      child: FlutterLogo(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Text(
                      "Hello\nWelcome Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: TextField(
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle:
                            TextStyle(color: Color(0xffcdcdcd), fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: <Widget>[
                          TextField(
                            obscureText: true,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: Color(0xffcdcdcd), fontSize: 16),
                            ),
                          ),
                          Text(
                            "Show",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton( // create box has width, height
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: _onSignIn,
                        child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "New user? Sign up",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            "Forgot password",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

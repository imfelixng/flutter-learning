import 'package:fl07_login_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isShow = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userErrMsg = 'Username is invalid';
  var _passErrMsg = 'Password is invalid';
  var _isUserInValid = false;
  var _isPassInValid = false;

  void _onSignIn() {
    String username = _userController.text;
    String password = _passController.text;

    bool checkUsername = username.length < 6 || username.contains('@');
    bool checkPassword = password.length < 6;

    setState(() {
      _isUserInValid = checkUsername;
      _isPassInValid = checkPassword;
    });

    if (!checkUsername && !checkPassword) {
      // Navigator.push(context, MaterialPageRoute(builder: _gotoHome));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  void _onToggleShow() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
                    onChanged: (text) {
                      bool checkUsername =
                          text.length < 6 || text.contains('@');
                      setState(() {
                        _isUserInValid = checkUsername;
                      });
                    },
                    controller: _userController,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: _isUserInValid ? _userErrMsg : null,
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
                          onChanged: (text) {
                            bool checkPassword =
                                text.length < 6 || text.contains('@');
                            setState(() {
                              _isPassInValid = checkPassword;
                            });
                          },
                          controller:
                              _passController, // get value from TextField
                          obscureText: !_isShow,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            errorText: _isPassInValid ? _passErrMsg : null,
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: Color(0xffcdcdcd), fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: _onToggleShow,
                          child: Text(
                            _isShow ? "HIDE" : "SHOW",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      // create box has width, height
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      onPressed: _onSignIn,
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
    );
  }

  Widget _gotoHome(BuildContext context) {
    return Home();
  }
}

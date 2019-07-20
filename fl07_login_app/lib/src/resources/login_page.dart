import 'package:fl07_login_app/src/blocs/login_bloc.dart';
import 'package:fl07_login_app/src/resources/home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isShow = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  LoginBloc bloc = new LoginBloc();

  void _onSignIn() {
    String username = _userController.text;
    String password = _passController.text;

    if (bloc.isValidInfo(username, password)) {
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
                    child: StreamBuilder(
                      stream: bloc.userStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _userController,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Username",
                            errorText: snapshot.hasError ? snapshot.error : null,
                            labelStyle: TextStyle(
                                color: Color(0xffcdcdcd), fontSize: 16),
                          ),
                        );
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        StreamBuilder(
                          stream: bloc.passStream,
                          builder: (context, snapshot) {
                            return TextField(
                              controller:
                                  _passController, // get value from TextField
                              obscureText: !_isShow,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              decoration: InputDecoration(
                                errorText: snapshot.hasError ? snapshot.error : null,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Color(0xffcdcdcd), fontSize: 16),
                              ),
                            );
                          },
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

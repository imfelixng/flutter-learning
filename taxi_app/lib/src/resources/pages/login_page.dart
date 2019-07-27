import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_app/src/resources/pages/forgot_password_page.dart';
import 'package:taxi_app/src/resources/pages/home_page.dart';
import 'package:taxi_app/src/resources/pages/signup_page.dart';
import 'package:taxi_app/src/resources/widgets/dialog/loading_dialog.dart';
import 'package:taxi_app/src/resources/widgets/dialog/message_dialog.dart';

import '../../app.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    var authBloc = MyApp.of(context).authBloc;

    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            constraints: BoxConstraints.expand(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Image.asset(
                      'assets/images/img_car_green.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Text(
                      "Login to continue using iCab",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: StreamBuilder(
                        stream: authBloc.emailStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          );
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: StreamBuilder(
                        stream: authBloc.passStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _passController,
                            obscureText: true,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          );
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: _onOpenForgotPassword,
                        child: Text(
                          "Forget password?",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: _onLogIn,
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "New User? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: _onOpenSignUp,
                          child: Text(
                            "Sign up for a new account",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void _onLogIn() {
    var email = _emailController.text;
    var pass = _passController.text;

    var authBloc = MyApp.of(context).authBloc;

    if (authBloc.isValidDataLogin(email, pass)) {
      LoadingDialog.showLoadingDialog(context, "Logging user...");
      authBloc.signIn(email, pass, () {
        _emailController.clear();
        _passController.clear();
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home()));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(context, "Sign In Error", msg);
      });
    }
  }

  void _onOpenForgotPassword() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  }

  void _onOpenSignUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  void dispose() {
    var authBloc = MyApp.of(context).authBloc;
    authBloc.dispose();
    super.dispose();
  }

}

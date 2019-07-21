import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/resources/login_page.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  AuthBloc authBloc = new AuthBloc();

  @override
  Widget build(BuildContext context) {
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Image.asset(
                      'assets/images/img_car_red.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Welcome Aboard!",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Text(
                      "Signup with iCab in simple steps",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: StreamBuilder(
                        stream: authBloc.nameStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.account_circle),
                                labelText: "Name",
                                labelStyle: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          );
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: StreamBuilder(
                        stream: authBloc.phoneStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                errorText:
                                    snapshot.hasError ? snapshot.error : null,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.phone),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          );
                        },
                      )),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        onPressed: _onSignUp,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already a User? ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: _onOpenLogin,
                          child: Text(
                            "Login now",
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

  void _onSignUp() {
    var name = _nameController.text;
    var phone = _phoneController.text;
    var email = _emailController.text;
    var pass = _passController.text;

    if (authBloc.isValidDataSignUp(name, phone, email, pass)) {
      print("Data valid");
    }
  }

  void _onOpenLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}

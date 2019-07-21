import 'package:flutter/material.dart';
import 'package:taxi_app/src/resources/login_page.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                height: 59,
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
                    fontWeight: FontWeight.w600
                  ),
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
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      labelStyle: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 16,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    onPressed: _onSignUp,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
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
          )
        ),
      ),
    );
  }

void _onSignUp() {

}

void _onOpenLogin() {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Login()
    ));
}

}
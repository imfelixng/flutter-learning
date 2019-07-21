import 'dart:async';

import 'package:taxi_app/src/firebase/firebase_auth.dart';

class AuthBloc {
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  FBAuth _fbAuth = new FBAuth();

  Stream get nameStream => _nameController.stream; // output
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool isValidDataSignUp(String name, String phone, String email, String pass) {
    print(name);
    bool isInvalidName = name == null || name.length == 0;
    bool isInvalidPhone = phone == null || phone.length == 0;
    bool isInvalidEmail = email == null || email.length == 0;
    bool isInvalidPass = pass == null || pass.length == 0;

    if (isInvalidName) {
      _nameController.sink.addError("Name is invalid");
      return false;
    }

    _nameController.sink.add("");

    if (isInvalidPhone) {
      _phoneController.sink.addError("Phone Number is invalid");
      return false;
    }

    _phoneController.sink.add("");

    if (isInvalidEmail) {
      _emailController.sink.addError("Email is invalid");
      return false;
    }
    _emailController.sink.add("");
    if (isInvalidPass) {
      _passController.sink.addError("Pass is invalid");
      return false;
    }
    _passController.sink.add("");

    return true;
  }

  void signUp(String name, String phone, String email, String pass, Function onSuccess, Function(String) onRegisterError) {
    _fbAuth.signUp(email, pass, name, phone, onSuccess, onRegisterError);
  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
  }

}

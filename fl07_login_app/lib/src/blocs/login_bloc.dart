import 'dart:async';

import 'package:fl07_login_app/src/validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream; // syntax shorter for get, set
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validation.isValidUser(username)) {
      _userController.sink.addError("Username is invalid"); // sink input
      return false;
    }

    _userController.sink.add("OK"); // sink new message replace for old error message

    if (!Validation.isValidPass(password)) {
      _passController.sink.addError("Password is invalid");
      return false;
    }

    _passController.sink.add("OK");

    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }

}
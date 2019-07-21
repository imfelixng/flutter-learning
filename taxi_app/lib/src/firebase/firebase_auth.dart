import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FBAuth {
  FirebaseAuth _fbAuth = FirebaseAuth.instance;
  FirebaseDatabase _fbDB = FirebaseDatabase.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _fbAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(user.uid, name, phone, onSuccess, onRegisterError);
    }).catchError((error) {
      _onSignUpError(error.code, onRegisterError);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fbAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      print(user);
      onSuccess();
    }).catchError((error) {
      _onSignInError(error.code, onSignInError);
    });
  }

  void _createUser(String userID, String name, String phone, Function onSuccess,
      Function(String) onRegisterError) {
    var user = {
      "name": name,
      "phone": phone,
    };

    var ref = _fbDB.reference().child("users");
    ref.child(userID).set(user).then((userInfo) {
      onSuccess();
    }).catchError((error) {
      onRegisterError("Can't sign up, please try again");
    });
  }

  void _onSignUpError(String code, Function(String) onRegisterError) {
    switch (code) {
      case 'ERROR_WEAK_PASSWORD':
        onRegisterError('The password is not strong enough');
        break;
      case 'ERROR_INVALID_EMAIL':
        onRegisterError('The email address is malformed');
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        onRegisterError('The email is already in use by a different account');
        break;
      default:
        onRegisterError("Can't sign up, please try again");
    }
  }

  void _onSignInError(String code, Function(String) onRegisterError) {
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        onRegisterError('The email address is malformed');
        break;
      case 'ERROR_WRONG_PASSWORD':
        onRegisterError('The password is wrong');
        break;
      case 'ERROR_USER_NOT_FOUND':
        onRegisterError('The user not found');
        break;
      case 'ERROR_USER_DISABLED':
        onRegisterError('The user has been disabled');
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        onRegisterError('There was too many attempts to sign in as this user');
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        onRegisterError("Can't sign in, please try again");
        break;
      default:
        onRegisterError("Can't sign in, please try again");
    }
  }
}

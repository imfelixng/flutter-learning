import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FBAuth {

  FirebaseAuth _fbAuth = FirebaseAuth.instance;
  FirebaseDatabase _fbDB = FirebaseDatabase.instance;

  void signUp(String email, String pass, String name, String phone, Function onSuccess) {
    _fbAuth.createUserWithEmailAndPassword(email: email, password: pass)
    .then((user) {
      _createUser(user.uid, name, phone, onSuccess);
    })
    .catchError((error) {
      print(error);
    });
  }

  void _createUser(String userID, String name, String phone, Function onSuccess) {
    var user = {
      "name": name,
      "phone": phone,
    };

    var ref = _fbDB.reference().child("users");
    ref.child(userID).set(user).then((userInfo) {
      onSuccess();
    })
    .catchError((error) {
      print(error);
    });
  }

}
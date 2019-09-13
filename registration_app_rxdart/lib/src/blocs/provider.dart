import 'package:flutter/material.dart';
import 'bloc.dart';
export 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc;

  Provider({Key key, Widget child})
      : bloc = Bloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}

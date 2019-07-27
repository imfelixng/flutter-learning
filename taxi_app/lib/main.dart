import 'package:flutter/material.dart';
import 'package:taxi_app/src/app.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/resources/pages/login_page.dart';

void main() => runApp(
  MyApp(
    new AuthBloc(),
    MaterialApp(
      home: Login(),
    )
  )
);
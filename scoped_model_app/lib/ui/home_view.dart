import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_app/scoped_model/home_model.dart';

import '../service_locator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<HomeModel>(
        model: locator<HomeModel>(),
        child: ScopedModelDescendant<HomeModel>(
            builder: (context, child, model) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await model.saveData();
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              body: Center(
                child: Text(model.title),
              ),
            )));
  }
}
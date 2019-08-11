import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model_app/enums/view_states.dart';
import 'package:scoped_model_app/scoped_model/home_model.dart';

import '../service_locator.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {

  Widget _getBodyUi(ViewState state) {
    switch (state) {
      case ViewState.Busy:
        return CircularProgressIndicator();
      case ViewState.Retrieved:
      default:
        return Text('Done');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel> (
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
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _getBodyUi(model.state),
                    Text(model.title),
                  ]
              )
          ),
        ),
    );
  }
}
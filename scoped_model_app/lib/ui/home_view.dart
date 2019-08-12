import 'package:flutter/material.dart';
import 'package:scoped_model_app/enums/view_states.dart';
import 'package:scoped_model_app/scoped_model/home_model.dart';
import 'package:scoped_model_app/widgets/busy_overlay.dart';

import '_error_view.dart';
import '_success_view.dart';
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
        builder: (context, child, model) => BusyOverlay(
          show: model.state == ViewState.Busy,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                var whereToNavigate = await model.saveData();
                if (whereToNavigate) {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessView(title: "Passed in from home")));
                } else {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ErrorView()));
                }
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
        ),
    );
  }
}
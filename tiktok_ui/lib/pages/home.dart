import 'package:flutter/material.dart';
import 'package:tiktok_ui/widgets/actions_toolbar.dart';
import 'package:tiktok_ui/widgets/bottom_toolbar.dart';
import 'package:tiktok_ui/widgets/video_description.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget get topSection => Container(
        height: 100.0,
        padding: EdgeInsets.only(bottom: 15.0),
        color: Colors.yellow[300],
      );

  Widget get middleSection => Expanded(
      child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionsToolbar()]));

  Widget get videoDescription =>
      Expanded(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 10.0, color: Colors.green[300], margin: EdgeInsets.only(top: 10)),
              Container(height: 10.0, color: Colors.green[300], margin: EdgeInsets.only(top: 10)),
              Container(height: 10.0, color: Colors.green[300], margin: EdgeInsets.only(top: 10))
            ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            topSection,
            middleSection,
            BottomToolbar(),
          ],
        ),
      ),
    );
  }
}

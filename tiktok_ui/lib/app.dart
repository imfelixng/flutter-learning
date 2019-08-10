import 'package:flutter/material.dart';

import 'package:tiktok_ui/pages/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        // Uncomment in phase 3 to apply white to text
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white
        ),
      ),    );
  }
}

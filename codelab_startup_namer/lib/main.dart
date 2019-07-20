import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is my app",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Startup namer",
          ),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
               RandomWords(),
                RandomWords(),
                 RandomWords()
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}

// save state for app
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordpair = WordPair.random();
    return Text(wordpair.asPascalCase);
  }
}

// Create state
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
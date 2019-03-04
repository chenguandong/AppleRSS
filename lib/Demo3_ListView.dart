import 'package:english_words/english_words.dart';

/**
 * ListView Demo
 */
import 'package:flutter/material.dart';

import 'Demo1.dart';
/**
 * ListView Demo
 */

/**
 * ListView Demo
 */

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _suggestions = <WordPair>[];
  final _saveSuggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildDuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saveSuggestions.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saveSuggestions.remove(pair);
          } else {
            _saveSuggestions.add(pair);
          }
        });
      },
      onLongPress: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new Scaffold(
              appBar: new AppBar(title: Text('跳转测试')),
              body: Center(
                child: new Text('666'),
              ));
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('随机ListView'),
      ),
      body: _buildDuggestions(),
    );
  }
}

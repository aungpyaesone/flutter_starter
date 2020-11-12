import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWord extends StatefulWidget{
  @override
  State<RandomWord> createState() => _RandomWordState();

}

class _RandomWordState extends State<RandomWord>{
  final _suggestions = <WordPair>[];
  /// add new set
  final _save = Set<WordPair>();

  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text('Startup name generator'),
     actions: <Widget>[
       IconButton(icon: Icon(Icons.list),onPressed: _pushSaved,)
     ],),
     body: _buildSuggestion(),
   );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
          final tiles = _save.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }
  Widget _buildSuggestion(){
    return ListView.builder(padding:EdgeInsets.all(16.0),itemBuilder: (context,i){
      if(i.isOdd) return Divider();
      final index = i ~/2;
      if(index >= _suggestions.length){
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }


  Widget _buildRow(WordPair pair){
    /// already save as favourite
    final alreadySaved = _save.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved){
            _save.remove(pair);
          }else{
            _save.add(pair);
          }
        });
      },
    );
  }
}
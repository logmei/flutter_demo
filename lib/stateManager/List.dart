
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:logmei_flutter_demo/animations/Heart.dart';

class ListWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new ListState();
  }
}

class ListState extends State<ListWidget>{
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('startup Name generator'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: _buildSuggestions(),

    );
  }

  // Widget _buildSuggestions(){
  //   return new ListView.builder(
  //     padding: const EdgeInsets.all(16.0),
  //     itemBuilder: (context,i){
  //       if(i.isOdd) return new Divider();
  //       final index = 1 ~/2;
  //       if(index>=_suggestions.length){
  //         _suggestions.addAll(generateWordPairs().take(10));
  //       }
  //       return _buildRow(_suggestions[index]);
  //     },
  //   );
  // }

    Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
         pair.asPascalCase,
         style: const TextStyle(fontSize: 18.0),
      ),
      trailing:alreadySaved? new HeartStateful(): new Icon(Icons.favorite_border)
        ,
      // new Icon(
      //   alreadySaved?Icons.favorite : Icons.favorite_border,
      //   color: alreadySaved?Colors.red: null,
      // ),
      onTap: (){
        setState(() {
         if(alreadySaved){
           _saved.remove(pair);
         } else {
           _saved.add(pair);
         }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context){
          final tiles = _saved.map(
            (pair){
              return new ListTile(title: new Text(pair.asPascalCase,style:const TextStyle(fontSize: 18.0)));
            }
          );

          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved suggestion'),
            ),
            body: new ListView(children: divided),
          );
        }
        )
    );
  }
}
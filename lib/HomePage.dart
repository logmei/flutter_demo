
import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
import 'package:logmei_flutter_demo/stateManager/List.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'home page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('home page'),
        ),
        body: new ListWidget(),
      ),
    );
  }
}

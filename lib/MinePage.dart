import 'package:flutter/material.dart';

class Minepage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mine page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('mine page'),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'data page',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child:new Text('data page')
          ),
        ),
      ),
    );
  }
}
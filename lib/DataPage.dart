import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
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
        body: Center(
          child: WebView(
            initialUrl: 'http://192.168.125.15:8080/',
            javascriptMode: JavascriptMode.unrestricted//do not work properly without javascript enabled
          ),
          ),
      ),
    );
  }
}
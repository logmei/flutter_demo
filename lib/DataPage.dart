import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new DataWidget();
  }
}

class DataWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DataState();
  }
}

class DataState extends State<DataWidget>{

  WebViewController webView;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Center(
        //     child:new Text('data page')
        //   ),
        // ),
        body: Center(
          child: WebView(
            initialUrl: 'http://192.168.125.15:9527/',
            onWebViewCreated: (WebViewController controller){
              webView = controller;
              print('created');
              // webView.evaluateJavascript('''
              // window.nativeLogin()
              // ''');
              // webView.addJavaScriptHandler('getPhoto', (args){
              //   print('web 调用app现场拍照');
              //   print(args);
              // });
              // webView.addJavaScriptHandler('getMap', (args){
              //   print('web调用app地图');
              //   print(args);
              // });
              // webView.addJavaScriptHandler('getTell', (args){
              //   print('web调用app电话');
              //   print(args);
              // });
              // webView.addJavaScriptHandler('getMinePage', (args){
              //    print('web调用app我的页面');
              //    print(args);
              // });
            },
            onPageFinished: (args){
              print('sssssssssss');
               webView.evaluateJavascript('''
                   window.nativeLogin()
              ''');
            },
            javascriptMode: JavascriptMode.unrestricted,//do not work properly without javascript enabled
          ),
          ),
      );
  }
}
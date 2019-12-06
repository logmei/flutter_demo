import 'package:flutter/material.dart';
import 'package:logmei_flutter_demo/MainPage.dart';
import 'package:logmei_flutter_demo/MinePage.dart';
import 'package:logmei_flutter_demo/service/ServiceLocater.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:logmei_flutter_demo/service/TelSmsService.dart';

class WorkOrders extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new WorkOrderWidget();
  }
}

class WorkOrderWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WorkOrderState();
  }
}

class WorkOrderState extends State<WorkOrderWidget>{
  WebViewController webView;
  final TelSmsService _service = locator<TelSmsService>();
  //js调用app，跳转到我的界面
  JavascriptChannel gotoMinePageChannel(BuildContext context){
    return JavascriptChannel(
      name: 'AppMinePage',
      onMessageReceived: (JavascriptMessage message){
        print('gotoMinePageChannel $message');
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context){
            return new MainPage(2);
          }
        ));
      });
  }
  //js调用app打电话接口
  JavascriptChannel TelChannel(BuildContext context){
    return JavascriptChannel(
      name:'CallTel',
      onMessageReceived:(JavascriptMessage message){
         print('CallTel $message');
        _service.call('123456778');
      } 
      );
  }
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
    return new MaterialApp(
      home: Scaffold(
        body: Container(
          child: WebView(
            initialUrl: 'http://192.168.125.15:9527/workOrders',
            onWebViewCreated: (WebViewController controller){
              webView = controller;
            },
            javascriptChannels: <JavascriptChannel>[
              gotoMinePageChannel(context)
            ].toSet(),
            onPageFinished: (args){
              webView.evaluateJavascript('''
                window.nativeLogin()
              ''');
            },
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}


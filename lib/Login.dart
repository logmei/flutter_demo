import 'package:flutter/material.dart';
class Login extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'demo',
      theme: new ThemeData(//设置整体色彩皮肤
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(35,194,183,1),
        accentColor: Color.fromRGBO(35,194,183,1),
      ),
      home: new LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new LoginState();
  }
}

class LoginState extends State<LoginWidget>{
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.only(left:25.0,right: 11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            new Container(
              padding: const EdgeInsets.only(top: 95,bottom: 90),
              child: new Text(
                '欢迎登录移动端demo',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  fontSize: 22.0,
                  color: new Color.fromRGBO(51, 51, 51, 1)
                )),
              
              ),
            new TextField(
                controller: _controller,
                maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
                maxLines: 1,//最大行数
                autocorrect: false,//是否自动更正
                autofocus: false,//是否自动对焦
                obscureText: false,//是否是密码
                textAlign: TextAlign.start,//文本对齐方式
                //键盘展示为号码
                //keyboardType: TextInputType.phone,
                decoration: new InputDecoration( //相当于placeholder
                  contentPadding: EdgeInsets.only(bottom: 5.0),
                  icon: Icon(Icons.people),
                  // hintText: '输入用户名',
                  labelText: '请输入用户名',
                  // helperText: '请输入您的账号，可以为手机号',
                  labelStyle: TextStyle(fontSize: 16.0,color:new Color.fromRGBO(153, 153, 153, 1) ),
                  // filled: true,
                  // fillColor: Colors.red
                  // border: OutlineInputBorder()
                ),
                style: TextStyle(fontSize: 16.0,color: new Color.fromRGBO(51, 51, 51, 1)),//输入文字的样式
                // inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
                onChanged: (text) {//内容改变的回调
                  print('change $text');
                },
                onSubmitted: (text) {//内容提交(按回车)的回调
                  print('submit $text');
                },
                enabled: true,//是否禁用
                cursorColor: new Color.fromRGBO(35,194,183,1),//光标颜色
          ),
         new TextField(
            maxLength:20,
            obscureText: true,
            decoration: new InputDecoration(
              contentPadding: const EdgeInsets.only(bottom: 5.0),
              icon: Icon(Icons.lock),
              labelText: '请输入密码',
              labelStyle: TextStyle(fontSize: 16.0,color: new Color.fromRGBO(153, 153, 153, 1))
            ),
            
          ),
           new Container(
            padding: const EdgeInsets.only(top: 66.0),
            width: 310,
            child:new RaisedButton(
              onPressed: () {print('ssssssss');},
              textColor: Color.fromRGBO(255,255,255,1),
              color: Color.fromRGBO(35,194,183,1),
              highlightColor: Color.fromRGBO(35,194,183,1),
              disabledColor: Color.fromRGBO(35,194,183,1),
              child: Text(
                '登录',
                style: new TextStyle(
                  fontSize: 16.0
                ),)
              )
          )

          ],
        )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:logmei_flutter_demo/LoginPage.dart';
import 'package:logmei_flutter_demo/WorkOrders.dart';

class Minepage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    void gongdanCallBackFun(){
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context){
          return WorkOrders();
        }
      ));
    }
    void loginOutFun(){
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context){
          return LoginPage();
        }
      ));
    }
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mine page',
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('mine page'),
        // ),
        body: new Container(
          color: Color.fromRGBO(249,249,249,1),
          child: new Column(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(top: 50,left: 20,bottom: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(255,255,255,1),
                  ),
                  child:  Row(
                  children: <Widget>[
                    new Container(
                      // margin: EdgeInsets.only(left: 20.0),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: new AssetImage('images/yao.png'),
                          fit: BoxFit.cover
                          )
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '李依依',
                            style: TextStyle(
                              fontSize:18,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(50, 50, 50, 1) 
                              ),
                              ),
                          new Container(
                            margin: EdgeInsets.only(top: 4.0),
                            child: Row(children: <Widget>[
                            Text('xxxx角色',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1) ,
                              ),),
                            new Container(
                              margin: EdgeInsets.only(left: 5,right: 5),
                              width: 1.0,
                              height: 12.0,
                              color: Color.fromRGBO(216,216,216,1),
                            ),
                            Text('xxxxxx部门',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(51, 51, 51, 1) ,
                              ),)
                          ],),
                          )
                          ,
                          new Container(
                            margin: EdgeInsets.only(top: 2.0),
                            child: Text('xxxxxxxx有限公司',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(153,153,153,1) ,
                              ),),)
                          
                        ],
                      ),
                    )
                    
                  ],
                ),
                ),
               
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 20),
                  color: Color.fromRGBO(255,255,255,1),
                  child: Column(
                    children: <Widget>[
                     new MenuList('我的工单','gongdan',gongdanCallBackFun).getWidget(),
                     new MenuList('版本更新','gengxin',null).getWidget(),
                     new MenuList('修改密码','updatePwd',null).getWidget()
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(top: 15,bottom: 15),
                  color: Color.fromRGBO(255,255,255,1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    GestureDetector(
                      onTap: loginOutFun,
                      child:  Text(
                        '退出登录',
                        style: TextStyle(
                          color: Color.fromRGBO(251,52,52,1)
                        ),
                     ),
                    )
                     
                  ],),
                )
               
              ],
            ),
        )
      )
    );
  }
}

class MenuList{
  String menuName;
  String leftIconName;
  final callBackFun;
  MenuList(this.menuName,this.leftIconName,this.callBackFun);
  getWidget(){
    return GestureDetector(
      onTap: callBackFun,
      child: new Container(
                padding: EdgeInsets.only(left: 23,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    new Container(
                      child: Row(
                        children:[
                          new Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Image.asset('images/$leftIconName.png'),
                            ),
                          Text(menuName)
                        ]
                      )
                    ),
                    GestureDetector(
                       onTap: callBackFun,
                      child: new Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Image.asset('images/right.png'),
                    ),
                    )
                    
                    
                  ]
                ),
              ),)
     ;
  }
}
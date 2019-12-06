import 'package:flutter/material.dart';
import 'package:logmei_flutter_demo/MinePage.dart';
import 'package:logmei_flutter_demo/HomePage.dart';
import 'package:logmei_flutter_demo/DataPage.dart';
import 'package:logmei_flutter_demo/BarPojo.dart';

class MainPage extends StatelessWidget {
  int _tabIndex = 0;
  MainPage(this._tabIndex);

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MainPageWidget(_tabIndex),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  int _tabIndex = 0;
  MainPageWidget(this._tabIndex);
  @override
  State<StatefulWidget> createState(){
    return new MainPageState(_tabIndex);
  }
}
/*
 * 主工作台的状态
 */
class MainPageState extends State<MainPageWidget>{
  int _tabIndex = 0 ;
  MainPageState(this._tabIndex);
  //appBars
  final appBarMap = [
    new BarPojo('工单', new Icon(Icons.hotel) , new DataPage()),
    new BarPojo('工作台', new Icon(Icons.home), new HomePage()),
    new BarPojo('我的', new Icon(Icons.people), new Minepage())
  ];
  /*
   * 获取tabItem
   */
  BottomNavigationBarItem getTabItem(index){
    if(index == _tabIndex){
      //设置选中样式
      appBarMap[index].choosed(true);
    } else {
      appBarMap[index].choosed(false);
    }
     return new BottomNavigationBarItem(icon:appBarMap[index].icon,title: appBarMap[index].title );
  }
  
  //构建
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: appBarMap[_tabIndex].page,
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          getTabItem(0),
          getTabItem(1),
          getTabItem(2)
        ],
        type: BottomNavigationBarType.fixed,
        //默认选中
        currentIndex: _tabIndex,
        iconSize: 24.0,
        //点击事件
        onTap: (index){
          setState(() {
           _tabIndex = index; 
          });
        },
      ),
      );
  }
}
import 'package:flutter/material.dart';
class BarPojo {
   Text title;
   Icon icon;
   Widget page;
  //  bool choosed = false;

   final styleMap = {
     'default': new TextStyle(fontSize: 14.0,color: Color(0xff515151)),
     'choosed' : new TextStyle(fontSize: 14.0,color: Color(0xff1296db))
   };
  
  BarPojo(String title,Icon icon,Widget page){
    this.title = new Text(title,style:styleMap['default']);
    this.icon = icon;
    this.page = page;
  }

  void choosed(bool value){
    if(value){
      this.chooseTabStyle();
    } else {
      this.defaultTabStyle();
    }
  }



  void chooseTabStyle(){
    this.title = new Text(this.title.data,style:styleMap['choosed']);
  }
  
  void defaultTabStyle(){
     this.title = new Text(this.title.data,style:styleMap['default']);
  }

}
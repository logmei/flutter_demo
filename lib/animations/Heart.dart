import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
/*
 * 采用有状态的widget
 */
class HeartStateful extends StatefulWidget{

    @override
    State<StatefulWidget> createState(){
      return new HeartState();
    }
}


class HeartState extends State<HeartStateful> with SingleTickerProviderStateMixin{
  // Animation是动画库中的核心类，拥有当前值和状态（完成或停止），与UI渲染没关系，可以通过实例获取当前的值
  Animation<double> animation;
  /*
   * AnimationController派生自Animation<double>,有控制动画的其他方法，范围是从0.0到1.0
   * forward():启动动画
   * reverse({dobule from}):倒放动画
   * reset()：重置动画
   * stop({bool cancel=true}):停止动画
   *  */
  AnimationController controller;
  Animation<int> animationColor;
  CurvedAnimation curve;
  Tween colorTween;


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );
    curve = new CurvedAnimation(parent: controller,curve: Curves.easeInOutBack);
    /**
     * Tween继承自Animatable<T>，而不是Animation<T>来配置生成不同范围或数据类型的值
     * Tween无状态，唯一职责是定义从输入范围到输出范围的映射
     */
    animation = new Tween(begin: 0.0,end: 30.0).animate(controller)
                ..addListener((){//动画的值发生变化时被调用
                  setState(() {
                    // the state that has changed here is the animation object’s value
                  });
                })
                ..addStatusListener((status){//动画状态发生变化时被调用
                  if(status == AnimationStatus.completed){
                    controller.reverse();
                  } else if (status == AnimationStatus.dismissed){
                    controller.forward();
                  }
                });
    colorTween = new ColorTween(begin: Colors.transparent,end: Colors.red);
    colorTween.animate(curve);
    controller.forward();
  }

    @override
    Widget build(BuildContext context){
        return new Icon(
          Icons.favorite,
          size: animation.value,
          color: Colors.red,
          );
    }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
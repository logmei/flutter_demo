import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HeartStateful extends StatefulWidget{

    @override
    State<StatefulWidget> createState(){
      return new HeartState();
    }
}


class HeartState extends State<HeartStateful> with SingleTickerProviderStateMixin{

    Animation<double> animation;
    AnimationController controller;
    CurvedAnimation curve;

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this
    );
    curve = new CurvedAnimation(parent: controller,curve: Curves.easeInOutBack);
    animation = new Tween(begin: 0.0,end: 30.0).animate(controller)
                ..addListener((){
                  setState(() {
                    // the state that has changed here is the animation object’s value
                  });
                });
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
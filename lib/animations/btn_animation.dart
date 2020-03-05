import 'package:flutter/material.dart';
import 'dart:math' as math;

class Btn_Animation extends StatefulWidget {
  @override
  _Btn_AnimationState createState() => _Btn_AnimationState();
}

class _Btn_AnimationState extends State<Btn_Animation> with    SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_animationController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });

    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      child: Center(
        child: new Directionality(
          textDirection: TextDirection.ltr,
          child: Transform.rotate(
            angle: animation.value,
            child:Icon(Icons.zoom_out_map,size: 40,color: Colors.redAccent,),
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

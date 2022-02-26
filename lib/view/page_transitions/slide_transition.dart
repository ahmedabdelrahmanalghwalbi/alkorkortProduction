import 'package:flutter/material.dart';

class SlideRightTransition extends PageRouteBuilder{
  final page;
  SlideRightTransition({this.page}):super(
      transitionDuration: Duration(seconds: 1),
      pageBuilder: (context,animation,animationTow)=>page,
      transitionsBuilder: (context,animation,animationTwo,child){
        var begin=Offset(-1.0, 0.0);
        var end=Offset.zero;
        var tween=Tween(begin: begin,end: end);
        var offsetAnimation =animation.drive(tween);
        return SlideTransition(position: offsetAnimation,child: child,);
      }
  );
}
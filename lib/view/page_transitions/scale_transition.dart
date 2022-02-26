import 'package:flutter/cupertino.dart';

class ScaleTransitionRoute extends PageRouteBuilder{
  final page;
  ScaleTransitionRoute({this.page}):super(
      transitionDuration: Duration(seconds: 1),
      pageBuilder: (context,animation,animationTwo)=>page,
      transitionsBuilder: (context,animation,animationTwo,child){
        var begin=0.0;
        var end =1.0;
        var tween=Tween(begin: begin,end: end);
        var curvesAnimation=CurvedAnimation(parent: animation,curve: Curves.easeInOut);
        return ScaleTransition(scale: tween.animate(curvesAnimation),child: child);
      }
  );
}
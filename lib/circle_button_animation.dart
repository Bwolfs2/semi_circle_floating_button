import 'package:flutter/material.dart';

import 'bloc_controller.dart';

mixin CircleButtonAnimation<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  AnimationController controller;
  Animation<Offset> positionAnimation;

   Offset get initialOffset;
   Offset get finalOffset;
   BlocController get bloc;
   Duration get duration;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration:duration, vsync: this);
    positionAnimation = Tween(
      begin: initialOffset,
      end: finalOffset,            
    ).animate(controller);
   
    bloc.opened.listen((value) {
      if (value) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:semi_circle_floating_buttom/bloc_controller.dart';

import 'circle_button_animation.dart';

class CircleButton extends StatefulWidget {
  final double finalTop;
  final double finalRight;  
  final double initState;
  final BlocController bloc;
  final Widget widget;
  final Duration duration;

  CircleButton(
      {Key key,
      this.finalTop,
      this.finalRight,
      this.initState,
      this.bloc,
      this.duration = const Duration(milliseconds: 300),
      this.widget})
      : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton>
    with TickerProviderStateMixin, CircleButtonAnimation {
  @override
  Offset get finalOffset => Offset(widget.finalTop, widget.finalRight);

  @override
  Offset get initialOffset => Offset(widget.initState, widget.initState);

  @override
  BlocController get bloc => widget.bloc;

@override
  Duration get duration => widget.duration ?? Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: positionAnimation,
      child:widget.widget,
      builder: (context, child) {
        return Positioned(
          top: positionAnimation.value.dy,
          left: positionAnimation.value.dx,
          child: Opacity(
            opacity: controller.value,
            child: child,
          ),
        );
      },
    );
  }

  
}

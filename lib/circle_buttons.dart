import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleButtons extends StatelessWidget {
  final int quantity;
  final Position position;
  final double radius;
  final double right;
  final double top;
  final bool completeCircle;

  const CircleButtons({Key key, this.quantity, this.position = Position.rigth, this.radius = 100, this.right, this.top, this.completeCircle = false})
      : assert(quantity != null),
        super(key: key);

  Offset _getOffset(double angle, double radius) {
    final double radians = math.pi * angle / 180.0;
    final double x = radius * math.cos(radians) * -1;
    final double y = radius * math.sin(radians) * -1;
    return Offset(x, y);
  }

  getRotatePosition(Position postion) {
    switch (postion) {
      case Position.bottom:
        return 90;
      case Position.left:
        return 180;
      case Position.top:
        return 270;
      case Position.rigth:
      default:
        return 0;
    }
  }

  getTop(Position postion) {

    if(top != null ){
        return top;
    }

    switch (postion) {
      case Position.bottom:
      case Position.rigth:
      case Position.left:
        return 130.0;
      case Position.top:      
        return completeCircle ? 130.0 : 20.0;
      default:
        return 0.0;
    }
  }

  getRight(Position postion) {

     if(right != null ){
        return right;
    }

    switch (postion) {
      case Position.rigth:
        return 20.0;
      case Position.bottom:
      case Position.left:
      case Position.top:
        return 130.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(      
      child: Stack(
          children: List.generate(quantity, (index) {

        var angulo = completeCircle ?  (360) / (quantity) * (index) : (180) / (quantity - 1) * (index);

        return Positioned(
          top: _getOffset(angulo + getRotatePosition(position), -radius).dx +
              getTop(position),
          right: _getOffset(angulo + getRotatePosition(position), -radius).dy +
              getRight(position),
          child: FloatingActionButton(
            backgroundColor: Colors.accents[Random().nextInt(16)],
            onPressed: (){},
            child: Text("$index"),
          ),
        );
      })),
    );
  }
}

enum Position {
  rigth,
  left,
  top,
  bottom,
}

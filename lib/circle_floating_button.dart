import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'bloc_controller.dart';
import 'circle_button.dart';

class CircleFloatingButton extends StatefulWidget {
  final List<Widget> items;
  final double radius;

  final Position position;
  final double right;
  final double top;
  final bool completeCircle;
  final CircleType type;
  final Duration duration;

  CircleFloatingButton(
      {Key key,
      this.items,
      this.radius = 100,
      this.position = Position.right,
      this.right,
      this.top,
      this.completeCircle = false,
      this.duration = const Duration(milliseconds: 300),
      this.type})
      : super(key: key ?? UniqueKey());

  factory CircleFloatingButton.floatingActionButton(
      {List<Widget> items, double radius = 100 , Duration duration}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: Position.bottom,
      type: CircleType.quarterPart,      
      duration: duration,
    );
  }

  factory CircleFloatingButton.completeCircle(
      {List<Widget> items, double radius = 100,Duration duration}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: Position.bottom,
      type: CircleType.complete,
       duration: duration,
    );
  }
  
    factory CircleFloatingButton.semiCircle (
      {List<Widget> items, double radius = 100, Position position, Duration duration}) {
    return CircleFloatingButton(
      items: items,
      radius: radius,
      position: position,
      type: CircleType.semi,
      duration: duration,
    );
  }


  @override
  _CircleFloatingButtonState createState() => _CircleFloatingButtonState();
}

class _CircleFloatingButtonState extends State<CircleFloatingButton> {
  BlocController bloc;
  GlobalKey containerKey = GlobalKey();

  @override
  initState() {
    super.initState();
    bloc = BlocController();
  }

  Offset _getOffset(double angle, double radius) {
    final double radians = math.pi * angle / 180.0;
    final double x = radius * math.cos(radians) * -1;
    final double y = radius * math.sin(radians) * -1;
    return Offset(x, y);
  }

  getRotatePosition(Position postion) {
    switch (postion) {
      case Position.right:
        return 90;
      case Position.bottom:
        return 180;
      case Position.left:
        return 270;
      case Position.top:
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CircleType.semi:
        return semi();
        break;
      case CircleType.complete:
        return complete();
        break;
      case CircleType.quarterPart:
        return quarterPart();
    }
  }

  Widget quarterPart() {
    var quantity = widget.items.length;
    return Container(
      width: widget.radius * 1.6,
      height: widget.radius * 1.6,
      child: Stack(
        children: List.generate(
          quantity,
          (index) {
            var angulo = (90) / (quantity - 1) * (index);

            return CircleButton(
              finalRight: _getOffset(
                          angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dy +
                  widget.radius,
              finalTop: _getOffset(angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dx +
                  widget.radius,
              initState: widget.radius,
              bloc: bloc,
              widget: widget.items[index],
              duration: widget.duration,
            );
          },
        )..add(
            Positioned(
              top: widget.radius,
              left: widget.radius,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  bloc.toggle();
                },
                child: Text("X"),
              ),
            ),
          ),
      ),
    );
  }

  Widget complete() {
    var quantity = widget.items.length;
    return Container(
      child: Stack(
        children: List.generate(
          quantity,
          (index) {
            var angulo = (360) / (quantity) * (index);

            return CircleButton(
                finalRight: _getOffset(
                            angulo + getRotatePosition(widget.position),
                            -widget.radius)
                        .dy +
                    widget.radius,
                finalTop: _getOffset(
                            angulo + getRotatePosition(widget.position),
                            -widget.radius)
                        .dx +
                    widget.radius,
                initState: widget.radius,
                bloc: bloc,
                duration: widget.duration,
                widget: widget.items[index]);
          },
        )..add(
            Positioned(
              top: widget.radius,
              left: widget.radius,
              child: FloatingActionButton(
                onPressed: () {
                  bloc.toggle();
                },
                child: Text("X"),
              ),
            ),
          ),
      ),
    );
  }

  Widget semi() {
    var quantity = widget.items.length;

    return Container(
      child: Stack(
        children: List.generate(
          quantity,
          (index) {
            var angulo = (180) / (quantity - 1) * (index);

            return CircleButton(
              finalRight: _getOffset(
                          angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dy +
                  widget.radius,
              finalTop: _getOffset(angulo + getRotatePosition(widget.position),
                          -widget.radius)
                      .dx +
                  widget.radius,
              initState: widget.radius,
              bloc: bloc,
              duration: widget.duration,
              widget: widget.items[index],
            );
          },
        )..add(
            Positioned(
              top: widget.radius,
              left: widget.radius,
              child: FloatingActionButton(
                onPressed: () {
                  bloc.toggle();
                },
                child: Text("X"),
              ),
            ),
          ),
      ),
    );
  }
}

enum CircleType {
  semi,
  complete,
  quarterPart,
}

enum Position {
  right,
  left,
  top,
  bottom,
}

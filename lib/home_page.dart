import 'package:flutter/material.dart';
import 'package:semi_circle_floating_buttom/circle_buttons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Circular"),
          centerTitle: true,
        ),
        body: ListView.separated(
          itemCount: 5,
          itemBuilder: (_, index) {
            switch (index) {
              case 0:
                return Center(
                  child: Container(
                    height: 250,
                    child: CircleButtons(
                      quantity: 10,
                      position: Position.top,
                      radius: 120,
                      right: (MediaQuery.of(context).size.width / 2) - 40,
                    ),
                  ),
                );
              case 1:
                return Center(
                  child: Container(
                    width: 400,
                    height: 400,
                    child: CircleButtons(
                      quantity: 20,
                      position: Position.top,
                      radius: 120,
                      completeCircle: true,
                      right: (MediaQuery.of(context).size.width / 2) - 50,
                    ),
                  ),
                );
              case 2:
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 250,
                    height: 400,
                    child: CircleButtons(
                      quantity: 5,
                      position: Position.left,
                      radius: 120,
                    ),
                  ),
                );
              case 3:
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 250,
                    height: 400,
                    child: CircleButtons(
                      quantity: 5,
                      position: Position.rigth,
                      radius: 120,
                    ),
                  ),
                );

              case 4:
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(                    
                    height: 250,
                    child: CircleButtons(
                      quantity: 5,
                      position: Position.bottom,
                      radius: 120,
                      right: (MediaQuery.of(context).size.width / 2) - 30,
                    ),
                  ),
                );
            }

            return CircularProgressIndicator();
          },
          separatorBuilder: (_, i) => Divider(
            height: 0,
            color: Colors.transparent,
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'circle_floating_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var items = [
      FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        onPressed: () {},
        child: Icon(Icons.camera),
      ),
      FloatingActionButton(        
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: Icon(Icons.card_giftcard),
      ),      
        FloatingActionButton(        
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: Icon(Icons.card_giftcard),
      ),     
        FloatingActionButton(        
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: Icon(Icons.card_giftcard),
      ),  
        FloatingActionButton(        
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: Icon(Icons.card_giftcard),
      ),        
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text("Circular"),
          centerTitle: true,          
        ),
        floatingActionButton: CircleFloatingButton.floatingActionButton(
          items: items,          
        ),
        body: Container(
          child:CircleFloatingButton.completeCircle(
            items: items,      
            duration: Duration(milliseconds: 300),     
          )),
        );
  }
}

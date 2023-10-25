import 'package:flutter/material.dart';

// Stateless Widget
// Staefulll widget

class Myapp extends StatelessWidget {
  const Myapp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Material(
        child: Container(
          color: Colors.yellow,
          child: Center(child: Text(
            "Hello Bro"
            style: TextStyle(
              fontSize: 40,
              color: Colors.white, 
              fontWeight: FontWeight.bold
            ))),
        ),
      ),
    );
  }
}

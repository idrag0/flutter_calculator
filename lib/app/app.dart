import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/homeView.dart';

// Stateless Widget
// Staefulll widget

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: HomeView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 230, 172),
      body: SafeArea(
        //top: false,
        bottom: false,
        child: Container(
          color: Color.fromARGB(255, 180, 230, 172),
          child: const CalculatorView(),
        ),
      ),
    );
  }
}

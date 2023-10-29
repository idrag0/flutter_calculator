import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final DisplayOneControler = TextEditingController();
  final DisplayTwoControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DisplayOneControler.text = x.toString();
    DisplayTwoControler.text = y.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calculator display
          CalculatorDiplay(
              hint: "Enter Fist Number", controller: DisplayOneControler),
          const SizedBox(
            height: 30,
          ),
          CalculatorDiplay(
              hint: "Enter Second Number", controller: DisplayTwoControler),
          const SizedBox(
            height: 30,
          ),
          Text(z.toString(),
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              )),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(DisplayOneControler.text)! +
                          num.tryParse(DisplayTwoControler.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(DisplayOneControler.text)! -
                          num.tryParse(DisplayTwoControler.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(DisplayOneControler.text)! *
                          num.tryParse(DisplayTwoControler.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(DisplayOneControler.text)! /
                          num.tryParse(DisplayTwoControler.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.divide)),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      x = 0;
                      y = 0;
                      z = 0;
                      DisplayOneControler.clear();
                      DisplayTwoControler.clear();
                    });
                  },
                  label: const Text("Clear")),
            ],
          ),
          // Display1(),
          //Expand
          // Calculator Button
        ],
      ),
    );
  }
}

class CalculatorDiplay extends StatelessWidget {
  const CalculatorDiplay({
    super.key,
    this.hint = "Enter a Number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.yellow,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(10)),

          // labelText: "hhkihj",
          hintText: hint,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 82, 78, 78),
          )),
    );
  }
}

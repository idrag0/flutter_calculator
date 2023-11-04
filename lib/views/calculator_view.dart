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

  late final AppLifecycleListener _listener;

  final DisplayOneControler = TextEditingController();
  final DisplayTwoControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DisplayOneControler.text = x.toString();
    DisplayTwoControler.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onShow() => print("onShow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume");
  void _onDetach() => print("onDetach called");
  void _onInactive() => print("onInactive");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  void _onStateChange(AppLifecycleState state) {
    print("onStateChange called with state: $state");
  }

  @override
  void dispose() {
    DisplayOneControler.dispose();
    DisplayTwoControler.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Calculator display
          CalculatorDiplay(
              key: Key("displayOne"),
              hint: "Enter Fist Number",
              controller: DisplayOneControler),
          const SizedBox(
            height: 30,
          ),
          CalculatorDiplay(
              key: Key("displayTwo"),
              hint: "Enter Second Number",
              controller: DisplayTwoControler),
          const SizedBox(
            height: 30,
          ),

          Text(
              key: Key("Result"),
              z.toString(),
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

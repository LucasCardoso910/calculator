import 'package:calculator/components/display.dart';
import 'package:calculator/components/keyboard.dart';
import 'package:calculator/models/memory.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();
  
  void _onPressed(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    const initialDisplay = Display(text: '0');

    return MaterialApp(
      home: Column(
        children: [
          initialDisplay,
          Keyboard(cb: _onPressed),
        ],
      ),
    );
  }
}

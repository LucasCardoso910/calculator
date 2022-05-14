import 'package:calculator/components/display.dart';
import 'package:calculator/components/keyboard.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

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

import 'package:calculator/components/display.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appChildren = [
      Display(text: '0'),
      Text("Keyboard"),
    ];

    return MaterialApp(
      home: Column(
        children: appChildren,
      ),
    );
  }
}

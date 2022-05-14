import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appChildren = [
      Text("Display"),
      Text("Keyboard"),
    ];

    return MaterialApp(
      home: Column(
        children: appChildren,
      ),
    );
  }
}

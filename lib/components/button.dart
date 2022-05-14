import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;

  const Button({Key? key, required this.buttonLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        child: Text(buttonLabel),
        onPressed: () {},
      ),
    );
  }
}

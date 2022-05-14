import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size; // get screen size

    return Container(
      height: mediaSize.height * 0.6, // set height as 60% of screen height
      child: Column(
        children: [
          Button(buttonLabel: '9'),
          Button(buttonLabel: '9'),
          Button(buttonLabel: '9'),
          Button(buttonLabel: '9'),
          Button(buttonLabel: '9'),
        ],
      ),
    );
  }
}

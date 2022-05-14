import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const buttonLabel = Text('9');
    Size mediaSize = MediaQuery.of(context).size; // get screen size

    return Container(
      height: mediaSize.height * 0.6, // set height as 60% of screen height
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
        ],
      ),
    );
  }
}

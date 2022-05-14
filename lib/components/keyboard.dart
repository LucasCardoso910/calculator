import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
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
          ButtonRow(
            buttons: [
              Button(buttonLabel: 'AC'),
              Button(buttonLabel: '%'),
              Button(buttonLabel: '/'),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '7'),
              Button(buttonLabel: '8'),
              Button(buttonLabel: '9'),
              Button(buttonLabel: 'x'),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '4'),
              Button(buttonLabel: '5'),
              Button(buttonLabel: '6'),
              Button(buttonLabel: '-'),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '1'),
              Button(buttonLabel: '2'),
              Button(buttonLabel: '3'),
              Button(buttonLabel: '+'),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '0'),
              Button(buttonLabel: ','),
              Button(buttonLabel: '='),
            ],
          ),
        ],
      ),
    );
  }
}

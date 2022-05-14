import 'package:calculator/components/button.dart';
import 'package:calculator/components/button_row.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  const Keyboard({Key? key, required this.cb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size; // get screen size

    return Container(
      height: mediaSize.height * 0.6, // set height as 60% of screen height
      child: Column(
        children: [
          ButtonRow(
            buttons: [
              Button.big(buttonLabel: 'AC', color: Button.darkGray, cb: cb),
              Button(buttonLabel: '%', color: Button.darkGray, cb: cb),
              Button.operation(buttonLabel: '/', cb: cb),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '7', cb: cb),
              Button(buttonLabel: '8', cb: cb),
              Button(buttonLabel: '9', cb: cb),
              Button.operation(buttonLabel: 'x', cb: cb),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '4', cb: cb),
              Button(buttonLabel: '5', cb: cb),
              Button(buttonLabel: '6', cb: cb),
              Button.operation(buttonLabel: '-', cb: cb),
            ],
          ),
          ButtonRow(
            buttons: [
              Button(buttonLabel: '1', cb: cb),
              Button(buttonLabel: '2', cb: cb),
              Button(buttonLabel: '3', cb: cb),
              Button.operation(buttonLabel: '+', cb: cb),
            ],
          ),
          ButtonRow(
            buttons: [
              Button.big(buttonLabel: '0', cb: cb),
              Button(buttonLabel: ',', cb: cb),
              Button.operation(buttonLabel: '=', cb: cb),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;

  const Display({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color.fromRGBO(48, 48, 48, 1);
    const displayTextStyle = TextStyle(
      fontWeight: FontWeight.w100,
      decoration: TextDecoration.none,
      fontSize: 80,
      color: Colors.white,
    );

    return Expanded(
      flex: 1, // takes all the space available
      child: Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: displayTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

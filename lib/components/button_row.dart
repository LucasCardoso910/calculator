import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(width: 1);

    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, button) {
          list.isEmpty ? list.add(button) : list.addAll([spacer, button]);
          return list;
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const labelFont =
      TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w200);
  static const darkGray = Color.fromRGBO(82, 82, 82, 1);
  static const lightGray = Color.fromRGBO(112, 112, 112, 1);
  static const orange = Color.fromRGBO(250, 158, 13, 1);

  final String buttonLabel;
  final bool big;
  final Color color;

  const Button({
    Key? key,
    required this.buttonLabel,
    this.big = false,
    this.color = lightGray,
  }) : super(key: key);

  const Button.big({
    Key? key,
    required this.buttonLabel,
    this.big = true,
    this.color = lightGray,
  }) : super(key: key);

  const Button.operation({
    Key? key,
    required this.buttonLabel,
    this.big = false,
    this.color = orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: Text(
          buttonLabel,
          style: labelFont,
        ),
        onPressed: () {},
      ),
    );
  }
}

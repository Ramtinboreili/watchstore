import 'package:flutter/material.dart';
import 'package:watchstore/component/button_style.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  final String text;
  void Function() onPressed;

  MainButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.75,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppButtonStyle.mainButtonStyle,
        child: Text(text),
      ),
    );
  }
}

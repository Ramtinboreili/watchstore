import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  TextInputType? inputType;

  AppTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.icon = const SizedBox(),
      this.textAlign = TextAlign.center,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label),
          AppDimens.medium.height,
          SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.75,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(hintText: hint, prefixIcon: icon),
            ),
          )
        ],
      ),
    );
  }
}

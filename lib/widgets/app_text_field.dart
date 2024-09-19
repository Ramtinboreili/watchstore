import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/dimens.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final String label;
  final String perfixlabel;
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
      this.perfixlabel = " ",
      this.textAlign = TextAlign.center,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimens.small , 4,AppDimens.small,0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: size.width * 0.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(perfixlabel ,style: AppTextStyles.title,),
                Text(label , style: AppTextStyles.title,),

              ],
            ),
          ),
          AppDimens.medium.height,
          SizedBox(
            height: size.height * 0.08,
            width: size.width * 0.75,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(hintText: hint, prefixIcon: icon , hintStyle: AppTextStyles.hint),
            ),
          )
        ],
      ),
    );
  }
}

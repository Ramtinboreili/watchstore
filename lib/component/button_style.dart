import 'package:flutter/material.dart';
import 'package:watchstore/res/dimens.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.medium))
          ),
          );
}
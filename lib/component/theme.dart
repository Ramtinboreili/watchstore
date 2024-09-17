import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        
        filled: true,
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.focused)) {
              return AppColors.focusedTextField;
            } else {
              return AppColors.unFocusedTextField;
            }
          },
        ),
        contentPadding: const EdgeInsets.all(AppDimens.medium),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.borderColor , width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.primaryColor, width: 2)),
      ),
      
      );
}

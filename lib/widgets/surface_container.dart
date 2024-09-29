
import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class SurfaceContainer extends StatelessWidget {

  const SurfaceContainer({
    super.key,
    required this.child
  });

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.medium),
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(
          AppDimens.medium, AppDimens.medium, AppDimens.medium, 0),
      decoration: const BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.all(Radius.circular(AppDimens.medium))),
          child: child,
    );
  }
}

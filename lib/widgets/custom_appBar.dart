import 'package:flutter/material.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
              color: AppColors.appbar,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow,
                    offset: Offset(0, 3),
                    blurRadius: 6)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium ,),
            child: child,
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}


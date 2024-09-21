
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';

// ignore: must_be_immutable
class btmNavItem extends StatelessWidget {
  String iconSvgPath;
  String text;
  bool isActive;
  void Function() ontap;
  btmNavItem(
      {super.key,
      required this.iconSvgPath,
      required this.isActive,
      required this.text,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        width: 50,
        color: AppColors.btmNavColor,
        child: Column(
          children: [
            SvgPicture.asset(
              iconSvgPath,
              colorFilter: ColorFilter.mode(
                  isActive
                      ? AppColors.btmNavActiveItem
                      : AppColors.btmNavInActiveItem,
                  BlendMode.srcIn),
            ),
            AppDimens.small.height,
            Text(
              text,
              style: isActive
                  ? AppTextStyles.btmNavActive
                  : AppTextStyles.btmNavInActive,
            )
          ],
        ),
      ),
    );
  }
}

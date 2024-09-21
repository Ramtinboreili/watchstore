import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(Assets.png.avatar.path),
        ),
        (AppDimens.medium * 1.5).height,
        const Text(
          AppStrings.chooseProfileImage,
          style: AppTextStyles.avatarText,
        )
      ],
    );
  }
}

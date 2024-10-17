import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.onTap, required this.file});
  final onTap;
  final file;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: size.width*0.3,
            height: size.width*0.3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: file == null
                  ? Image.asset(Assets.png.avatar.path)
                  : Image.file(file),
            ),
          ),
          (AppDimens.medium * 1.5).height,
          const Text(
            AppStrings.chooseProfileImage,
            style: AppTextStyles.avatarText,
          )
        ],
      ),
    );
  }
}

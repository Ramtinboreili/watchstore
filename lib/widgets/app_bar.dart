
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class RegistrationAppBar extends StatelessWidget implements PreferredSizeWidget{
  const RegistrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(size.width, size.height * 0.15),
        child: Padding(
          padding: const EdgeInsets.only(left: AppDimens.medium , right: AppDimens.medium ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed:() => Navigator.pop(context), icon: const Icon(CupertinoIcons.back)),
              const Text(
                AppStrings.register,
                style: AppTextStyles.title2,
              )
            ],
          ),
        ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height* 0.15);
}

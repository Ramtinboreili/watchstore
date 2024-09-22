import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
                width: double.infinity,
                child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.mainLogo.path),
          (AppDimens.large).height,
          Text(AppStrings.otpCodeSendFor
              .replaceAll(AppStrings.replace, "09122132114") , style: AppTextStyles.title,),
              AppDimens.small.height,
          const Text(AppStrings.wrongNumberEditNumber , style: AppTextStyles.primaryThemeTextStyle, ),
          (AppDimens.large).height,
          AppTextField(
              label: AppStrings.enterVerificationCode,
              hint: AppStrings.hintVerificationCode,
              controller: _controller),
          MainButton(
            text: AppStrings.next,
            onPressed: () => Navigator.pushNamed(context, ScreenNames.registerScreen),
          )
        ],
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/app_text_field.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.png.mainLogo.path),
            (AppDimens.large * 2).height,
            AppTextField(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                controller: _controller),
          ],
        ),
      )),
    );
  }
}

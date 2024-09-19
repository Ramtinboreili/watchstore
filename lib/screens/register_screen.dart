import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/widgets/app_bar.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  TextEditingController _controllerNameLastName = TextEditingController();
  TextEditingController _controllerHomeNumber = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegistrationAppBar(size: size),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppDimens.medium.height,
                const Avatar(),
                (AppDimens.medium * 1.5).height,
                AppTextField(
                    label: AppStrings.nameLastName,
                    hint: AppStrings.hintNameLastName,
                    controller: _controllerNameLastName),
                AppTextField(
                    label: AppStrings.homeNumber,
                    hint: AppStrings.hintHomeNumber,
                    controller: _controllerHomeNumber),
                AppTextField(
                    label: AppStrings.address,
                    hint: AppStrings.hintAddress,
                    controller: _controllerHomeNumber),
                AppTextField(
                    label: AppStrings.postalCode,
                    hint: AppStrings.hintPostalCode,
                    controller: _controllerHomeNumber),
                AppTextField(
                  label: AppStrings.location,
                  hint: AppStrings.hintLocation,
                  controller: _controllerHomeNumber,
                  icon: const Icon(Icons.add_location_outlined),
                ),
                MainButton(
                  text: AppStrings.next,
                  onPressed: () => Navigator.pushNamed(context,ScreenNames.mainScreen),
                ),
                AppDimens.medium.height
              ],
            ),
          ),
        ),
      ),
    );
  }
}

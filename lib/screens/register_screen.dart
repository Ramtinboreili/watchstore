import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/utils/image_handeler.dart';
import 'package:watchstore/widgets/app_bar.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();

  final TextEditingController _controllerHomeNumber = TextEditingController();

  ImageHandeler imageHandeler = ImageHandeler();

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
                Avatar(
                  onTap: () async => await imageHandeler
                      .pickAndCroppImg(source: ImageSource.gallery)
                      .then((value) => setState(() {})),
                  file: imageHandeler.getImage,
                ),
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
                  onPressed: () =>
                      Navigator.pushNamed(context, ScreenNames.mainScreen),
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

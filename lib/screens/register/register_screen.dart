import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/data/Model/user.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/screens/register/cubit/register_cubit.dart';
import 'package:watchstore/utils/image_handeler.dart';
import 'package:watchstore/widgets/app_bar.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/avatar.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerHomeNumber = TextEditingController();
  final TextEditingController _controllerAddres = TextEditingController();
  final TextEditingController _controllerpostalCode = TextEditingController();
  final TextEditingController _controllerlocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;

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
            child: BlocProvider(
              create: (context) => RegisterCubit(),
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
                      controller: _controllerAddres),
                  AppTextField(
                      label: AppStrings.postalCode,
                      hint: AppStrings.hintPostalCode,
                      controller: _controllerpostalCode),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LocationpikedState) {
                        if (state.location != null) {
                          _controllerlocation.text =
                              "${state.location!.latitude} - ${state.location!.longitude}";
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickTheLocation(context: context);
                        },
                        child: AppTextField(
                          label: AppStrings.location,
                          hint: AppStrings.hintLocation,
                          controller: _controllerlocation,
                          icon: const Icon(Icons.add_location_outlined),
                        ),
                      );
                    },
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is OkResponsState) {
                        Navigator.pushNamed(context, ScreenNames.mainScreen);
                      } else if (state is ErorrState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.red,
                                duration: Durations.long4,
                                content: Text(
                                  "خطایی رخ داده است  ",
                                  textDirection: TextDirection.rtl,
                                )));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return MainButton(
                          text: AppStrings.next,
                          onPressed: () async {
                            User user = User(
                                name: _controllerNameLastName.text,
                                address: _controllerAddres.text,
                                image: await MultipartFile.fromFile(
                                    imageHandeler.getImage!.path),
                                lat: lat,
                                lng: lng,
                                phone: _controllerHomeNumber.text,
                                postalcode: _controllerpostalCode.text);
                            BlocProvider.of<RegisterCubit>(context)
                                .regiset(user: user);
                          },
                        );
                      } 
                    },
                  ),
                  AppDimens.medium.height
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

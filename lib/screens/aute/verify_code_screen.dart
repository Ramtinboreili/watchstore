import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/screens/aute/cubit/autentication_cubit_cubit.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 120;

  startTimer() {
    const onsec = Duration(seconds: 1);
    _timer = Timer.periodic(
      onsec,
      (timer) {
        setState(() {
          if (_start == 0) {
            _timer.cancel();
            Navigator.pop(context);
          } else {
            _start--;
          }
        });
      },
    );
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int seconds = sec % 60;

    String minString = min.toString().padLeft(2, "0");
    String secondsString = seconds.toString().padLeft(2, "0");
    return "$minString:$secondsString";
  }

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
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
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, mobileRouteArg),
                style: AppTextStyles.title,
              ),
              AppDimens.small.height,
              GestureDetector(
                onTap: () {
                  _timer.cancel();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: AppTextStyles.primaryThemeTextStyle,
                ),
              ),
              (AppDimens.large).height,
              AppTextField(
                  label: AppStrings.enterVerificationCode,
                  hint: AppStrings.hintVerificationCode,
                  perfixlabel: formatTime(_start),
                  controller: _controller),
              BlocConsumer<AutenticationCubit, AutenticationState>(
                listener: (context, state) {
                  if (state is VerifiedNotRegState) {
                    Navigator.pushNamed(context, ScreenNames.registerScreen);
                  } else if (state is VerifiedIsRegState) {
                    Navigator.pushNamed(context, ScreenNames.mainScreen);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MainButton(
                      text: AppStrings.next,
                      onPressed: () {
                        _timer.cancel();
                        BlocProvider.of<AutenticationCubit>(context)
                            .verifyCode(mobileRouteArg, _controller.text);
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/screens/aute/cubit/autentication_cubit_cubit.dart';
import 'package:watchstore/widgets/app_text_field.dart';
import 'package:watchstore/widgets/main_button.dart';

// ignore: must_be_immutable
class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.png.mainLogo.path),
              (AppDimens.large * 1.5).height,
              AppTextField(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                controller: _controller,
              ),
              BlocConsumer<AutenticationCubit, AutenticationState>(
                listener: (context, state) {
                  if (state is SendState) {
                    Navigator.pushNamed(context, ScreenNames.verifyCodeScreen,
                        arguments: state.mobile);
                  } else if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return MainButton(
                    text: AppStrings.sendOtpCode,
                    onPressed: () {
                      BlocProvider.of<AutenticationCubit>(context)
                          .sendSms(_controller.text);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDimens.medium + 4),
                child: Container(
                  height: 54,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.searchBar,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(80, 0, 0, 0),
                            offset: Offset(0, 3),
                            blurRadius: 4)
                      ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        SvgPicture.asset(Assets.svg.search),
                        const SizedBox.shrink(),
                        const Text(AppStrings.searchProduct  , style: AppTextStyles.hint,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(Assets.png.mainLogo.path , scale: 0.5,),
                        )
                      ],),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

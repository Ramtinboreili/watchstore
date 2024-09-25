import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/app_slider.dart';
import 'package:watchstore/widgets/cat_widget.dart';
import 'package:watchstore/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppDimens.medium.height,
              //search bar
              Searchbar(
                onTap: () {},
              ),
              AppDimens.small.height,
              // Slider
              const AppSlider(
                imagList: [],
              ),
              AppDimens.medium.height,
              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Catwidget(
                      title: AppStrings.desktop,
                      onTap: () {},
                      gradcolors: AppColors.catDesktopColors,
                      iconPath: Assets.svg.desktop),
                  Catwidget(
                      title: AppStrings.digital,
                      onTap: () {},
                      gradcolors: AppColors.catDigitalColors,
                      iconPath: Assets.svg.digital),
                  Catwidget(
                      title: AppStrings.smart,
                      onTap: () {},
                      gradcolors: AppColors.catSmartColors,
                      iconPath: Assets.svg.smart),
                  Catwidget(
                      title: AppStrings.classic,
                      onTap: () {},
                      gradcolors: AppColors.catClasicColors,
                      iconPath: Assets.svg.clasic),
                ],
              ),
              AppDimens.medium.height,
              // Amazing Products
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: [
                    SizedBox( 
                      height: 300,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        shrinkWrap: true,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(AppDimens.small),
                            margin: const EdgeInsets.all(AppDimens.medium),
                            height: 295,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.medium),
                                gradient: const LinearGradient(
                                    colors: AppColors.productBgGradiant,
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              children: [
                                AppDimens.medium.height,
                                Image.asset(Assets.png.unnamed.path),
                                AppDimens.small.height,
                                const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      " ساعت مردانه",
                                      style: AppTextStyles.productTitle,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      '${2265000.seppratWithComma}  تومان',
                                      style: AppTextStyles.title2,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.red),
                                      child: const Text(
                                        "20%",
                                        style: AppTextStyles.tagTitle,
                                      ),
                                    )
                                  ],
                                ),
                                 Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      4122000.seppratWithComma,
                                      style: AppTextStyles.oldPriceStyle,
                                    )),
                                AppDimens.small.height,
                                Container(
                                  width: double.infinity,
                                  height: 2,
                                  color: AppColors.primaryColor,
                                ),
                                AppDimens.small.height, 
                                const Text("09:26:22" , style: AppTextStyles.prodTimerStyle,)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const VerticalText(),
                    AppDimens.small.width,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  const VerticalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Transform.rotate(
                  angle: 1.5,
                  child: SvgPicture.asset(Assets.svg.back)),
                AppDimens.small.width,
                Text(
                  AppStrings.viewAll,
                  style: AppTextStyles.caption1,
                ),
              ],
            ),
            AppDimens.medium.height,
            const Text(
              AppStrings.amazing,
              style: AppTextStyles.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/app_slider.dart';
import 'package:watchstore/widgets/cat_widget.dart';
import 'package:watchstore/widgets/product_item.dart';
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
                indV: true,
              ),
              AppDimens.medium.height,
              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Catwidget(
                      title: AppStrings.desktop,
                      onTap: () {},
                      gradcolors: AppColors.catDesktopColors,
                      iconPath: Assets.svg.clasic),
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
                          return const ProductItem(
                            productname: "ساعت مردانه",
                            price: 1233000,
                            discount: 22,
                            oldPrice: 1800000,
                            time: 22,
                          );
                        },
                      ),
                    ),
                    VerticalText(
                      title: AppStrings.amazing,
                    ),
                    AppDimens.small.width,
                  ],
                ),
              ),
              AppDimens.medium.height,
              // Banner
              Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(120)),
                child: Image.network(
                  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/mainpage-desk1.jpg',
                ),
              ),
              AppDimens.medium.height,
              //Most seller
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
                          return const ProductItem(
                            productname: "ساعت مردانه",
                            price: 3890000,
                            discount: 40,
                            oldPrice: 7660000,
                            time: 0,
                          );
                        },
                      ),
                    ),
                    VerticalText(
                      title: AppStrings.topSells,
                    ),
                    AppDimens.small.width,
                  ],
                ),
              ),
              // Newest products
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
                          return const ProductItem(
                            productname: "ساعت مردانه",
                            price: 3228900,
                            discount: 0,
                            oldPrice: 0,
                            time: 0,
                          );
                        },
                      ),
                    ),
                    VerticalText(
                      title: AppStrings.newestProduct,
                    ),
                    AppDimens.small.width,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

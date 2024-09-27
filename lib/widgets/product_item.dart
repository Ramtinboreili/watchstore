import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productname,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = 0,
  });

  final productname;
  final int price;
  final int oldPrice;
  final int discount;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.small),
      margin: const EdgeInsets.all(AppDimens.medium),
      height: 297,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.medium),
          gradient: const LinearGradient(
              colors: AppColors.productBgGradiant,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          AppDimens.small.height,
          Image.asset(Assets.png.unnamed.path),
          AppDimens.small.height,
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                productname,
                style: AppTextStyles.productTitle,
              )),
          AppDimens.small.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${price.seppratWithComma}  تومان',
                style: AppTextStyles.title2,
              ),
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red),
                  child: Text(
                    "$discount%",
                    style: AppTextStyles.tagTitle,
                  ),
                ),
              )
            ],
          ),
          //old Price
          Visibility(
            visible: oldPrice > 0 ? true : false,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  oldPrice.seppratWithComma,
                  style: AppTextStyles.oldPriceStyle,
                )),
          ),
          AppDimens.small.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Container(
              width: double.infinity,
              height: 2,
              color: AppColors.primaryColor,
            ),
          ),
          AppDimens.small.height,
          Visibility(
            visible: time > 0 ? true : false,
            child: Text(
              "09:26:22",
              style: AppTextStyles.prodTimerStyle,
            ),
          )
        ],
      ),
    );
  }
}

class VerticalText extends StatelessWidget {
  VerticalText({super.key, required this.title});
  final title;
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
                    angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
                AppDimens.small.width,
                Text(
                  AppStrings.viewAll,
                  style: AppTextStyles.caption1,
                ),
              ],
            ),
            AppDimens.medium.height,
            Text(
              title,
              style: AppTextStyles.amazingStyle,
            )
          ],
        ),
      ),
    );
  }
}

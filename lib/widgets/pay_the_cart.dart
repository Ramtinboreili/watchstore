import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class PayTheCart extends StatelessWidget {
  const PayTheCart({
    super.key,
    required this.price,
  });

  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
      width: double.infinity,
      height: 75,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow, offset: Offset(0, 0), blurRadius: 4)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.totalPrice.replaceAll(AppStrings.replace,price.seppratWithComma ) ,
            style: AppTextStyles.title2,
          ),
          ElevatedButton(
              onPressed: () {},
              child: const Text(
                AppStrings.continueToPurchase,
                style: AppTextStyles.mainbuttn,
              )),
        ],
      ),
    );
  }
}

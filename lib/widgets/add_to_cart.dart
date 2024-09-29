
import 'package:flutter/material.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key, required this.price,  this.oldPrice = 0,  this.discount = 0,
  });
  
    final int price;
  final int oldPrice;
  final int discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimens.medium),
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
                color: AppColors.shadow,
                offset: Offset(0, 0),
                blurRadius: 4)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${price.seppratWithComma}  تومان',
                    style: AppTextStyles.title2,
                  ),
                  AppDimens.small.width,
                  Visibility(
                    visible:discount>0? true:false,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child:  Text(
                        "$discount%",
                        style: AppTextStyles.tagTitle,
                      ),
                    ),
                  )
                ],
              ),
              Visibility(
                visible: oldPrice>0?true:false,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      oldPrice.seppratWithComma,
                      style: AppTextStyles.oldPriceStyle,
                    )),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                color: AppColors.primaryColor,
                child: const Text(
                  AppStrings.addToBasket,
                  style: AppTextStyles.mainbuttn,
                ),
              )),
        ],
      ),
    );
  }
}

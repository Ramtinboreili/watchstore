import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/custom_appBar.dart';
import 'package:watchstore/widgets/pay_the_cart.dart';
import 'package:watchstore/widgets/shopping_cart_item.dart';
import 'package:watchstore/widgets/surface_container.dart';

class BascketScreen extends StatelessWidget {
  const BascketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
          child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: Text(
            AppStrings.basket,
            style: AppTextStyles.title,
          ),
        ),
      )),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: AppDimens.large),
            padding: const EdgeInsets.all(AppDimens.medium),
            width: size.width,
            height: size.height * 0.12,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: AppColors.shadow, offset: Offset(0, 3), blurRadius: 8)
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AppDimens.small.height,
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.sendToAddress,
                      style: AppTextStyles.caption,
                    )),
                AppDimens.medium.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svg.leftArrow)),
                    const Expanded(
                      child: Text(
                        AppStrings.lurem,
                        style: AppTextStyles.title,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          AppDimens.medium.height,
          Expanded(
              child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return  ShoppingCartItem(count: 2,price: 20000000,title: "ساعت کاسیو",withDiscount: 1900000,);
            },
          )),
          const PayTheCart(price: 6360000)
        ],
      ),
    ));
  }
}

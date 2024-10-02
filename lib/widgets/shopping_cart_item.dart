import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/widgets/surface_container.dart';

// ignore: must_be_immutable
class ShoppingCartItem extends StatelessWidget {
  ShoppingCartItem(
      {super.key,
      required this.price,
      required this.withDiscount,
      required this.title,
      required this.count,
      this.img});

  int count = 0;
  final int price;
  final int withDiscount;
  final title;
  final img;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return SurfaceContainer(
        child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: AppTextStyles.title,
              ),
              AppDimens.small.height,
              Text(
                "قیمت : ${price.seppratWithComma} تومان",
                style: AppTextStyles.caption,
                overflow: TextOverflow.ellipsis,
              ),
              Text("باتخفیف  : ${withDiscount.seppratWithComma} تومان",
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.primaryColor)),
              AppDimens.small.height,
              const Divider(
                height: 1,
                color: Colors.black38,
                thickness: 1,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.delete)),
                  const Expanded(child: SizedBox()),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.minus)),
                  Text(
                    "$count عدد",
                    style: AppTextStyles.caption.copyWith(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.plus)),
                ],
              )
            ],
          ),
        ),
        Image.asset(
          Assets.png.unnamed.path,
          height: 135,
        )
      ],
    ));
  }
}

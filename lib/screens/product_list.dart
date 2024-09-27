import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/cart_badge.dart';
import 'package:watchstore/widgets/custom_appBar.dart';
import 'package:watchstore/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartBadge(count: 2),
                Row(
                  children: [
                    const Text(
                      AppStrings.topSells,
                      style: AppTextStyles.title,
                    ),
                    AppDimens.small.width,
                    SvgPicture.asset(Assets.svg.sort)
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close)),
              ],
            ),
          ),
          body: Column(
            children: [AppDimens.medium.height, TagList() , ProductGridview()],
          )),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 26,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          reverse: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimens.small,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.small, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(AppDimens.medium),
              ),
              child: Text(
                "نیوفورس",
                style: AppTextStyles.tagTitle,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductGridview extends StatelessWidget {
  const ProductGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
          itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2 , childAspectRatio: 0.70),
      itemBuilder: (context, index) {
        return const ProductItem(productname: 'ساعت کاسیو', price: 1277000 , time: 1,discount: 14,oldPrice: 1600000,);
      },
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.only(left: 12,right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(CupertinoIcons.cart),
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
        ),
        body: Container(
          color: const Color.fromARGB(255, 142, 75, 30),
          width: double.infinity,
          height: double.infinity,
          child: const Center(
              child: Text(
            "ProductListScreen",
            style: TextStyle(fontSize: 40),
          )),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: preferredSize, child: child);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

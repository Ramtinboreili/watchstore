import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/add_to_cart.dart';
import 'package:watchstore/widgets/cart_badge.dart';
import 'package:watchstore/widgets/custom_appBar.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CartBadge(),
              const Expanded(
                  child: Text(
                "ساعت کاسیو مردانه",
                style: AppTextStyles.productTitle,
                textDirection: TextDirection.rtl,
              )),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    Assets.svg.close,
                    height: 22,
                  ))
            ],
          )),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.png.unnamed.path,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    Container(
                      margin: const EdgeInsets.all(AppDimens.medium),
                      padding: const EdgeInsets.all(AppDimens.medium),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.medium),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppDimens.medium.height,
                          const Text(
                            "ساعت کاسیو مردانه",
                            style: AppTextStyles.productTitle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            "ساعت کاسیو مردانه سه موتوره قهوه ای ",
                            style: AppTextStyles.caption,
                            textDirection: TextDirection.rtl,
                          ),
                          AppDimens.small.height,
                          const Divider(),
                          const ProductTabView()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child:  AddToCart(price: 1468000,discount: 10,oldPrice: 1700000,),
              )
            ],
          )),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tbs.length,
            itemExtent: MediaQuery.sizeOf(context).width / tbs.length,
            reverse: true,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() => selectedTabIndex = index),
              child: Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Text(
                  tbs[index],
                  style: selectedTabIndex == index
                      ? AppTextStyles.selectedTab
                      : AppTextStyles.unSelectedTab,
                ),
              ),
            ),
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [const Features(), const Reviews(), const Commnets()],
        )
      ],
    );
  }
}

List<String> tbs = [
  AppStrings.features,
  AppStrings.review,
  AppStrings.commnets,
];

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد. لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که ",
      textDirection: TextDirection.rtl,
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
        "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ",
        textDirection: TextDirection.rtl);
  }
}

class Commnets extends StatelessWidget {
  const Commnets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(child: Text("NoTHING")),
    );
  }
}

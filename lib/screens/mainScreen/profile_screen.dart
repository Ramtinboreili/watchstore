import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/widgets/custom_appBar.dart';
import 'package:watchstore/widgets/surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(
          child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: Text(
            AppStrings.profile,
            style: AppTextStyles.title,
          ),
        ),
      )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.large.height,
              //profil pic
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.asset(Assets.png.avatar.path),
              ),
              AppDimens.medium.height,
              const Text(
                "رامتین بریلی",
                style: AppTextStyles.avatarText,
              ),
              AppDimens.large.height,
              // User content
              Padding(
                padding: const EdgeInsets.all(AppDimens.large),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppStrings.activeAddress,
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
                    ),
                    AppDimens.medium.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "۳۱۳۴۸۹۴۵۳۹",
                          style: AppTextStyles.selectedTab,
                        ),
                        AppDimens.small.width,
                        SvgPicture.asset(
                          Assets.svg.postalCode,
                          height: 25,
                        ),
                      ],
                    ),
                    AppDimens.medium.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "۰۹۱۲۲۶۸۳۴۲۹",
                          style: AppTextStyles.selectedTab,
                        ),
                        AppDimens.small.width,
                        SvgPicture.asset(
                          Assets.svg.phone,
                          height: 25,
                        ),
                      ],
                    ),
                    AppDimens.medium.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "رامتین بریلی",
                          style: AppTextStyles.selectedTab,
                        ),
                        AppDimens.small.width,
                        SvgPicture.asset(
                          Assets.svg.user,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppDimens.medium.height,
              // outher UI
              const SurfaceContainer(
                  child: Text(
                AppStrings.termOfService,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.title2,
              )),
              AppDimens.small.height,

              // in process
              SurfaceContainer(
                  child: Padding(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.delivered)),
                        AppDimens.medium.height,
                        Text(
                          AppStrings.delivered,
                          style: AppTextStyles.caption1,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.cancelled)),
                        AppDimens.medium.height,
                        Text(
                          AppStrings.cancelled,
                          style: AppTextStyles.caption1,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.inProccess)),
                        AppDimens.medium.height,
                        Text(
                          AppStrings.inProccess,
                          style: AppTextStyles.caption1,
                        )
                      ],
                    ),
                  ],
                ),
              )),
              AppDimens.medium.height,
              Container(
                padding: const EdgeInsets.all(AppDimens.medium),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(120)),
                child: Image.network(
                  'https://ticktackgallery.com/media/wysiwyg/ticktackbanner/mainpage-desk5.jpg',fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/extentions.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/res/dimens.dart';

class Catwidget extends StatelessWidget {
  const Catwidget({
    super.key,required this.title,required this.onTap,required this.gradcolors,required this.iconPath,
  });

  final String title ;
  final onTap ;
  final List<Color> gradcolors ; 
  final String iconPath ; 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap ,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(AppDimens.small),
            height: size.height * 0.1,
            width: size.height * 0.1,
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    colors: gradcolors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(AppDimens.large)),
            child: Center(child: SvgPicture.asset(iconPath , height: 70,)),
          ),
          AppDimens.small.height,
           Text(
            title,
            style: AppTextStyles.title2,
          )
        ],
      ),
    );
  }
}

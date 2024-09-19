import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/gen/assets.gen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * 0.1;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: btmNavHeight,
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: btmNavHeight,
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: btmNavHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svg.user)),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svg.cart)),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(Assets.svg.home)),
                  ],
                ),
              )),
        ],
      ),
    ));
  }
}

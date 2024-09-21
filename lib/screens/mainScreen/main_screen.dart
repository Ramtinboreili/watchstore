import 'package:flutter/material.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/res/strings.dart';
import 'package:watchstore/screens/mainScreen/bascket_screen.dart';
import 'package:watchstore/screens/mainScreen/home_screen.dart';
import 'package:watchstore/screens/mainScreen/profile_screen.dart';
import 'package:watchstore/widgets/btm_navbar.dart';

class BtmNavScreenIndex {
 BtmNavScreenIndex._();
 static const home = 0 ; 
 static const bascket = 1 ; 
 static const profile = 2  ; 
}

class MainScreen extends StatefulWidget {
   const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home ; 
  final GlobalKey<NavigatorState> _homekey = GlobalKey();
  final bool _canpop = false ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * 0.1;
    return SafeArea(
        child: PopScope(
          // onPopInvoked: ,
          canPop: _canpop,
          child: Scaffold(
                body: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: btmNavHeight,
                child:  IndexedStack(
                  index: selectedIndex ,
                  children:  [
                      Navigator(
                        key: _homekey,
                        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const HomeScreen(),),
                      ),
                      Navigator(
                        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const BascketScreen(),),
                      ),
                      Navigator(
                        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const ProfileScreen(),),
                      ),
                      
                ],)),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: AppColors.btmNavColor,
                  width: double.infinity,
                  height: btmNavHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      btmNavItem(
                        iconSvgPath: Assets.svg.user,
                        isActive: selectedIndex==BtmNavScreenIndex.profile ,
                        text: AppStrings.profile,
                        ontap:()=> btmNavOnpressed(index: BtmNavScreenIndex.profile),
                      ),
                      btmNavItem(
                        iconSvgPath: Assets.svg.cart,
                        isActive: selectedIndex==BtmNavScreenIndex.bascket,
                        text: AppStrings.basket,
                        ontap:()=> btmNavOnpressed(index: BtmNavScreenIndex.bascket),
                      ),
                      btmNavItem(
                        iconSvgPath: Assets.svg.home,
                        isActive: selectedIndex==BtmNavScreenIndex.home ,
                        text: AppStrings.home,
                        ontap:()=> btmNavOnpressed(index: BtmNavScreenIndex.home),
                      ),
                    ],
                  ),
                )),
          ],
                ),
              ),
        ));
  }


  btmNavOnpressed({required index}){

    setState(() {
      selectedIndex = index ; 
    });
  }
}

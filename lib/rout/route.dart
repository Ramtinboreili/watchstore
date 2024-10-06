import 'package:flutter/material.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/screens/aute/verify_code_screen.dart';
import 'package:watchstore/screens/mainScreen/main_screen.dart';
import 'package:watchstore/screens/product_list.dart';
import 'package:watchstore/screens/product_single_screen.dart';
import 'package:watchstore/screens/register_screen.dart';
import 'package:watchstore/screens/aute/send_otp_screen.dart';

Map<String , Widget Function(BuildContext)> routes = {

  ScreenNames.root : (context) => SendOtpScreen(),
  ScreenNames.verifyCodeScreen : (context) => VerifyCodeScreen(),
  ScreenNames.registerScreen : (context) => RegisterScreen(),
  ScreenNames.mainScreen : (context) => const MainScreen(),
  ScreenNames.productListScreen : (context) => const ProductListScreen(),
  ScreenNames.productSingleScreen : (context) => const ProductSingleScreen(),
  

};
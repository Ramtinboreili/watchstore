import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/rout/route.dart';
import 'package:watchstore/screens/product_single_screen.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.primaryColor));
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'watch Store',
      theme: lightTheme(),
      initialRoute: ScreenNames.root ,
      routes: routes,
      // home: ProductSingleScreen(),
    );
  }
}



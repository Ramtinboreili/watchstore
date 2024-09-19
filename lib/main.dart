import 'package:flutter/material.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/rout/route.dart';

void main() {
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
    );
  }
}



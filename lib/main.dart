import 'package:flutter/material.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/screens/get_otp_screen.dart';

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
      home: GetOtpScreen(),
    );
  }
}



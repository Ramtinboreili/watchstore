import 'package:flutter/material.dart';
import 'package:watchstore/rout/names.dart';
import 'package:watchstore/screens/get_otp_screen.dart';
import 'package:watchstore/screens/mainScreen/main_screen.dart';
import 'package:watchstore/screens/register_screen.dart';
import 'package:watchstore/screens/send_otp_screen.dart';

Map<String , Widget Function(BuildContext)> routes = {

  ScreenNames.root : (context) => SendOtpScreen(),
  ScreenNames.getOtpScreen : (context) => GetOtpScreen(),
  ScreenNames.registerScreen : (context) => RegisterScreen(),
  ScreenNames.mainScreen : (context) => MainScreen(),
  

};
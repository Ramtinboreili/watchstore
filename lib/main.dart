import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchstore/component/theme.dart';
import 'package:watchstore/res/colors.dart';
import 'package:watchstore/rout/route.dart';
import 'package:watchstore/screens/aute/cubit/autentication_cubit_cubit.dart';
import 'package:watchstore/screens/aute/send_otp_screen.dart';
import 'package:watchstore/screens/mainScreen/main_screen.dart';
import 'package:watchstore/utils/shared_perferences_manager.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.primaryColor));
     WidgetsFlutterBinding.ensureInitialized();
     await SharedPerferencesManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutenticationCubit(),
      child: MaterialApp(
        title: 'watch Store',
        theme: lightTheme(),
        routes: routes,
        home: BlocBuilder<AutenticationCubit, AutenticationState>(
          builder: (context, state) {
            if (state is LogginState) {
              return const MainScreen();
            } else if (state is LogoutState) {
              return SendOtpScreen();
            } else {
              return SendOtpScreen();
            }
          },
        ),
      ),
    );
  }
}

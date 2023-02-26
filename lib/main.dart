import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/res/color.dart';
import 'package:social_media/res/fonts.dart';
import 'package:social_media/utils/routes/get_routes.dart';
import 'package:social_media/utils/routes/route_name.dart';
import 'package:social_media/view/home/home.dart';
import 'package:social_media/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppColors.whiteColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 22,
            fontFamily: AppFonts.sfProDisplayMedium,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 22,
            fontFamily: AppFonts.sfProDisplayMedium,
          ),
          bodyMedium: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 18,
            fontFamily: AppFonts.sfProDisplayMedium,
          ),
          bodySmall: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 16,
            fontFamily: AppFonts.sfProDisplayMedium,
          ),
          titleSmall: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 16,
            fontFamily: AppFonts.sfProDisplayRegular,
          ),
          titleMedium: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 18,
            fontFamily: AppFonts.sfProDisplayRegular,
          ),
          titleLarge: TextStyle(
            color: AppColors.primaryTextTextColor,
            fontSize: 22,
            fontFamily: AppFonts.sfProDisplayRegular,
          ),
        ),
      ),
      home: Home(),

      // onGenerateRoute: Routes.generateRoute,
    );
  }
}

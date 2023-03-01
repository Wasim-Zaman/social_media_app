import 'package:flutter/material.dart';
import 'package:social_media/res/color.dart';
import 'package:social_media/res/fonts.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
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
  );
}

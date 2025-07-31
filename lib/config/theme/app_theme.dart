import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = AppColors.orange;
  static const Color backgroundColor = AppColors.backgroundColor;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        surface: backgroundColor,
      ),

      fontFamily: 'Shabnam',
      scaffoldBackgroundColor: backgroundColor,

      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.backgroundColor,
        foregroundColor: AppColors.orange,
        elevation: 8,
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontFamily: 'Shabnam',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: AppColors.myGrey,
        elevation: 8,
      ),
    );
  }
}

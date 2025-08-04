import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = AppColors.orange;
  static const Color backgroundColor = AppColors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        surface: backgroundColor,
      ),

      scaffoldBackgroundColor: backgroundColor,

      appBarTheme: const AppBarTheme(
        surfaceTintColor: AppColors.white,
        foregroundColor: AppColors.myBlack,
        elevation: 8,
        titleTextStyle: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.myBlack,
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

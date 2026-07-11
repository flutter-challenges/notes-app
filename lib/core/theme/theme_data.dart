import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors/app_colors.dart';

class AppThemeData {
  static ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: DarkAppColors.primaryColor,
      scaffoldBackgroundColor: DarkAppColors.backGroundColor, 
      appBarTheme: const AppBarTheme(
        backgroundColor: DarkAppColors.appBarColor,
        iconTheme: IconThemeData(color: DarkAppColors.iconsAndAppBar),
        actionsIconTheme: IconThemeData(color: DarkAppColors.iconsAndAppBar),
      ), 
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: DarkAppColors.floatingActionButtonColor,
      ),
      iconTheme: const IconThemeData(color: DarkAppColors.iconsAndAppBar),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: DarkAppColors.textTitleColor),
        titleMedium: TextStyle(color: DarkAppColors.textContentColor),
      ),
    );
  }

  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: LightAppColors.primaryColor,
      scaffoldBackgroundColor: LightAppColors.backGroundColor, 
      appBarTheme: const AppBarTheme(
        backgroundColor: LightAppColors.appBarColor,
        iconTheme: IconThemeData(color: LightAppColors.iconsAndAppBar),
        actionsIconTheme: IconThemeData(color: LightAppColors.iconsAndAppBar),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: LightAppColors.floatingActionButtonColor,
      ),
      iconTheme: const IconThemeData(color: LightAppColors.iconsAndAppBar),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: LightAppColors.textTitleColor),
        titleMedium: TextStyle(color: LightAppColors.textContentColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppDarkTheme {
  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.textPrimaryColor,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.textPrimaryColor,
    surface: AppColors.darkBackgroundColor,
    onSurface: AppColors.textPrimaryColor,
    onError: AppColors.textPrimaryColor,
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,

    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle:GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white)
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle:
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      indicator: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
      ),
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      fillColor: AppColors.darkInputBackgroundColor,
      filled: true,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      hintStyle: TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        padding: EdgeInsets.symmetric(vertical: 20),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle:
        GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

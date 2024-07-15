import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const easyGreyColor = Color.fromRGBO(238, 240, 242, 1);
  static const whiteGreyColor = Color.fromRGBO(237, 239, 234, 1);
  static const borderGreyColor = Color.fromRGBO(142, 142, 141, 1);
  static const yellowColor = Color.fromRGBO(255, 185, 84, 1);
  static const darkYellowColor = Color.fromRGBO(226, 134, 0, 1);
  static const lightRedColor = Color.fromRGBO(232, 111, 111, 1);
  static const redColor = Color.fromRGBO(168, 32, 13, 1);
  static const darkRedColor = Color.fromRGBO(140, 8, 0, 1);
  static const lightGreenColor = Color.fromRGBO(158, 232, 111, 1);
  static const greenColor = Color.fromRGBO(20, 140, 0, 1);
  static const darkGreenColor = Color.fromRGBO(22, 51, 0, 1);
}

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    appBarTheme: const AppBarTheme(
      elevation: 1,
      shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      surfaceTintColor: Color.fromRGBO(255, 255, 255, 1),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: const Color.fromRGBO(255, 255, 255, 1),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkGreenColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(0, 0, 0, 0.3),
      ),
      errorStyle: const TextStyle(
        color: Color.fromRGBO(168, 32, 13, 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromRGBO(142, 142, 141, 1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromRGBO(51, 119, 0, 1)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color.fromRGBO(168, 32, 13, 1)),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.easyGreyColor,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(158, 232, 111, 1),
        ),
        minimumSize: MaterialStatePropertyAll(Size(double.infinity, 48)),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(22, 51, 0, 1),
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(102, 102, 102, 1),
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(20, 140, 0, 1),
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(14, 15, 12, 1),
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        height: 2,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(14, 15, 12, 1),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Color.fromRGBO(23, 51, 0, 1),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(18, 18, 18, 1),
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(14, 15, 12, 1),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(0, 0, 0, 1),
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: Color.fromRGBO(22, 51, 0, 1),
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(0, 0, 0, 0.5),
      ),
    ),
  );
}

extension BuildContextEx on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get themeData => Theme.of(this);
}

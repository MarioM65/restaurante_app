import 'package:flutter/material.dart';

class AppTheme {
  static final Color primaryColor = Colors.deepOrange;
  static final Color accentColor = Colors.amber;
  static final Color textColor = Colors.grey[800]!;
  static final Color lightTextColor = Colors.grey[600]!;
  static final Color backgroundColor = Colors.grey[50]!;
  static final Color cardColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    hintColor: accentColor,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: textColor),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: textColor),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: textColor),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: textColor),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: textColor),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: textColor),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: textColor),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: lightTextColor),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: lightTextColor),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      labelStyle: TextStyle(color: lightTextColor),
      hintStyle: TextStyle(color: lightTextColor),
    ),
    cardTheme: CardThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: cardColor,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}
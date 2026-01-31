import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,

    primaryColor: Colors.blue,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 1,
    ),

    scaffoldBackgroundColor: Colors.grey.shade100,

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,

    primaryColor: Colors.blue,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 1,
    ),

    scaffoldBackgroundColor: Colors.black,

    cardTheme: CardThemeData(
      color: Colors.grey.shade900,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

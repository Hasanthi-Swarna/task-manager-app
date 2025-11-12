import 'package:flutter/material.dart';

// Light mode colors: brown for text/elements, cream/off-white for background
final Color lightBrown = const Color.fromARGB(255, 95, 57, 43);
final Color lightCream = const Color.fromARGB(255, 245, 225, 225);

// Dark mode colors: reversed (cream for text/elements, brown for background)
final Color darkCream = const Color.fromARGB(255, 245, 225, 225);
final Color darkBrown = const Color.fromARGB(255, 95, 57, 43);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'CaveatBrush',
  useMaterial3: true,
  primarySwatch: Colors.brown,
  colorScheme: ColorScheme.light(
    primary: lightBrown,
    secondary: Colors.brown.shade400,
    surface: lightCream,
    onPrimary: lightCream,
    onSecondary: lightCream,
    onSurface: lightBrown,
  ),
  scaffoldBackgroundColor: lightCream,
  appBarTheme: AppBarTheme(
    backgroundColor: lightBrown,
    foregroundColor: lightCream,
    iconTheme: IconThemeData(color: lightCream),
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 2,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: lightBrown),
    bodyMedium: TextStyle(color: lightBrown),
    bodySmall: TextStyle(color: lightBrown),
    titleLarge: TextStyle(color: lightBrown),
    titleMedium: TextStyle(color: lightBrown),
    titleSmall: TextStyle(color: lightBrown),
  ),
  iconTheme: IconThemeData(color: Colors.brown),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: lightBrown,
    foregroundColor: lightCream,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'CaveatBrush',
  useMaterial3: true,
  primarySwatch: Colors.brown,
  colorScheme: ColorScheme.dark(
    primary: darkCream,
    secondary: Colors.brown.shade200,
    surface: darkBrown,
    onPrimary: darkBrown,
    onSecondary: darkBrown,
    onSurface: darkCream,
  ),
  scaffoldBackgroundColor: darkBrown,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBrown,
    foregroundColor: darkCream,
    iconTheme: IconThemeData(color: darkCream),
  ),
  cardTheme: CardThemeData(
    color: Colors.brown.shade800,
    elevation: 2,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: darkCream),
    bodyMedium: TextStyle(color: darkCream),
    bodySmall: TextStyle(color: darkCream),
    titleLarge: TextStyle(color: darkCream),
    titleMedium: TextStyle(color: darkCream),
    titleSmall: TextStyle(color: darkCream),
  ),
  iconTheme: IconThemeData(color: darkCream),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: darkCream,
    foregroundColor: darkBrown,
  ),
);

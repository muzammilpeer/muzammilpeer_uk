import 'package:flutter/material.dart';

class PortfolioTheme {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue,foregroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue,foregroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.grey,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );
}

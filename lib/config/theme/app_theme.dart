import 'package:flutter/material.dart';

// class AppTheme{
//   ThemeData getTheme()=> ThemeData(
//     useMaterial3: true,
//     colorSchemeSeed: const Color(0xFF2862F5)
//   );
// }

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Colors.purple;
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(iconColor: seedColor));
  }
}

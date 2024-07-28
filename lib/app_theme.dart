import 'package:flutter/material.dart';

const _mainColor = Color(0xFF191D2B);
const _background = Color(0xFFF3F3F3);

extension CustomThemeData on ThemeData {
  Color get mainColor => _mainColor;

  Color get backgroundColor => _background;

  MaterialColor get neutral {
    const colors = {
      0: Color(0xFFFFFFFF),
      100: Color(0xFFF3F7F9),
      200: Color(0xFFE8EAEE),
      300: Color(0xFFD0D5DC),
      400: Color(0xFFB6BEC9),
      500: Color(0xFF96A0B5),
      600: Color(0xFF697896),
      700: Color(0xFF121F3E),
      800: Color(0xFF21273B),
      900: _mainColor,
    };
    return MaterialColor(colors[500]!.value, colors);
  }

  Color get blue => const Color(0xFF5599f9);

  Color get orange => const Color(0xFFFD7722);

  Color get pink => const Color(0xFFE84C88);

  Color get purple => const Color(0xFFD08CDF);

  Color get green => const Color(0xFF5ECEB3);

  Color get red => const Color(0xFFE05353);

  MaterialColor get background {
    const colors = {
      100: Color(0xFFF3F3F3),
      200: Color(0xFFE7E7E7),
      300: Color(0xFFB7B7B7),
      400: Color(0xFF707070),
      500: Color(0xFF111111),
    };
    return MaterialColor(colors[500]!.value, colors);
  }
}

ThemeData get appTheme => ThemeData(
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(primary: _mainColor),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: _mainColor)));

import 'package:flutter/material.dart';
import 'package:how_to_draw/theme/font_theme.dart';
import 'package:how_to_draw/theme/theme_constant.dart';

ThemeData get kBrandTheme {
  final base = ThemeData.light();

  return base.copyWith(
    textTheme: buildTextTheme(base.textTheme),
    primaryColor: kBrandPinkColor,
    primaryColorBrightness: Brightness.dark,
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
    accentColor: kBrandPinkColor,
    accentColorBrightness: Brightness.dark,
    accentTextTheme: buildTextTheme(base.accentTextTheme),
    scaffoldBackgroundColor: kBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      focusElevation: 0.0,
      highlightElevation: 0.0,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0.0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black87,
      ),
      textTheme: buildTextTheme(base.textTheme),
    ),
  );
}

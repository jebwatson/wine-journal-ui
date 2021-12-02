import 'package:flutter/material.dart';
import 'package:wine_journal_ui/pallette.dart';

final ThemeData baseLight = ThemeData.light();
final ThemeData baseDark = ThemeData.dark();

ThemeData themeDark = baseDark.copyWith(
  primaryColor: backgroundDark,
  primaryColorLight: primaryLight,
  primaryColorDark: primaryDark,
);

ThemeData themeLight = baseLight.copyWith(
  primaryColor: backgroundLight,
);

import 'package:flutter/material.dart';
import 'package:wine_journal_ui/pallette.dart';

final ThemeData baseLight = ThemeData.light();
final ThemeData baseDark = ThemeData.dark();

ThemeData theme = baseDark.copyWith(
  primaryColor: grayWeb,
  primaryColorLight: chardonnay,
  primaryColorDark: burgundy,
);

ThemeData themeLight = baseLight.copyWith(
  primaryColor: magnolia,
);

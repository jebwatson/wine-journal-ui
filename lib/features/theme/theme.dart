import 'package:flutter/material.dart';
import 'package:wine_journal_ui/pallette.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: burgundy,
  backgroundColor: burgundy.shade400,
  toggleableActiveColor: magnolia,
  iconTheme: IconThemeData(color: magnolia),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: magnolia),
    headline4: TextStyle(color: magnolia),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: chardonnay,
  backgroundColor: chardonnay.shade600,
);

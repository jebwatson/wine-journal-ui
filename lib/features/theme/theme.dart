import 'package:flutter/material.dart';
import 'package:wine_journal_ui/pallette.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: merlot,
  backgroundColor: merlot,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: merlot),
  toggleableActiveColor: magnolia,
  cardColor: burgundy,
  iconTheme: IconThemeData(color: magnolia),
  textTheme: TextTheme(
    bodyText2: TextStyle(color: magnolia),
    headline4: TextStyle(color: magnolia),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: rose,
  backgroundColor: rose,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: rose),
  cardColor: chardonnay,
);

import 'package:flutter/material.dart';
import 'package:wine_journal_ui/pallette.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: burgundy,
  scaffoldBackgroundColor: burgundy
      .shade400, // Would like to use a gradient here to look like a glass of wine
  toggleableActiveColor: magnolia,
  textTheme: TextTheme(
    bodyText2: TextStyle(color: magnolia),
    headline4: TextStyle(color: magnolia),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: chardonnay,
  scaffoldBackgroundColor: chardonnay.shade600,
);

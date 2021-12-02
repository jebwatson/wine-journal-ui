import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _isDarkMode,
        onChanged: (isDarkMode) {
          setState(() {
            _isDarkMode = isDarkMode;

            // Toggle to the opposite value
            Get.changeThemeMode(_isDarkMode ? ThemeMode.dark : ThemeMode.light);
          });
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _isDarkMode = false;
  Image whiteWine = Image.asset('images/white_wine.png');
  Image redWine = Image.asset('images/red_wine.png');

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _isDarkMode,
        activeThumbImage: redWine.image,
        inactiveThumbImage: whiteWine.image,
        onChanged: (isDarkMode) {
          setState(() {
            _isDarkMode = isDarkMode;

            // Toggle to the opposite value
            Get.changeThemeMode(_isDarkMode ? ThemeMode.dark : ThemeMode.light);
          });
        });
  }
}

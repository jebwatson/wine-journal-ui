import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/pallette.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePickerCubit, ThemePickerState>(
      builder: (context, state) {
        return Switch(
            value: state.isDarkMode,
            activeColor: magnolia,
            inactiveThumbColor: magnolia,
            activeThumbImage: Image.asset('images/red_wine.png').image,
            inactiveThumbImage: Image.asset('images/white_wine.png').image,
            onChanged: (isDarkMode) {
              Get.changeThemeMode(BlocProvider.of<ThemePickerCubit>(context)
                      .toggleTheme()
                      .isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light);
            });
      },
    );
  }
}

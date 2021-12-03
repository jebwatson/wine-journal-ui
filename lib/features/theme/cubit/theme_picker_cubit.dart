import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'theme_picker_state.dart';

class ThemePickerCubit extends Cubit<ThemePickerState> {
  ThemePickerCubit() : super(LightTheme());

  Map<Type, ThemePickerState> stateMap = {
    LightTheme: DarkTheme(),
    DarkTheme: LightTheme(),
  };

  void toggleTheme() {
    Get.changeThemeMode(state.isDarkMode ? ThemeMode.light : ThemeMode.dark);
    emit(stateMap[state.runtimeType] ?? LightTheme());
  }
}

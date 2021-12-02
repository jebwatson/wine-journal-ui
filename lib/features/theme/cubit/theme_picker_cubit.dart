import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_picker_state.dart';

class ThemePickerCubit extends Cubit<ThemeMode> {
  Map<Type, ThemeMode> themeMap = {
    DarkTheme: ThemeMode.light,
    LightTheme: ThemeMode.dark,
  };

  ThemePickerCubit() : super(ThemeMode.light);

  ThemePickerCubit.initial(ThemeMode initialState) : super(initialState);

  void toggleTheme() {
    emit(themeMap[state.runtimeType] ?? ThemeMode.light);
  }
}

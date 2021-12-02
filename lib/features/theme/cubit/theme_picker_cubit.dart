import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wine_journal_ui/features/theme/theme.dart';

part 'theme_picker_state.dart';

class ThemePickerCubit extends Cubit<ThemePickerState> {
  Map<Type, ThemePickerState> themeMap = {
    DarkTheme: LightTheme(),
    LightTheme: DarkTheme(),
  };

  ThemePickerCubit() : super(DarkTheme());

  ThemePickerCubit.initial(ThemePickerState initialState) : super(initialState);

  void toggleTheme() {
    emit(themeMap[state.runtimeType] ?? LightTheme());
  }
}

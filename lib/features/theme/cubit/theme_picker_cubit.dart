import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'theme_picker_state.dart';

class ThemePickerCubit extends Cubit<ThemePickerState> {
  ThemePickerCubit() : super(LightTheme());

  Map<Type, ThemePickerState> stateMap = {
    LightTheme: DarkTheme(),
    DarkTheme: LightTheme(),
  };

  ThemePickerState toggleTheme() {
    var newState = stateMap[state.runtimeType] ?? LightTheme();
    emit(newState);
    return newState;
  }
}

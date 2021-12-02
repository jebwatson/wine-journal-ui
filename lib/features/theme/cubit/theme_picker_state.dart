part of 'theme_picker_cubit.dart';

@immutable
abstract class ThemePickerState {
  final ThemeData theme;
  final bool isDarkMode;

  const ThemePickerState(this.theme, this.isDarkMode);
}

class DarkTheme extends ThemePickerState {
  DarkTheme() : super(themeDark, true);
}

class LightTheme extends ThemePickerState {
  LightTheme() : super(themeLight, false);
}

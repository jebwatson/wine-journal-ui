part of 'theme_picker_cubit.dart';

@immutable
abstract class ThemePickerState {
  final ThemeMode themeMode;

  const ThemePickerState(this.themeMode);
}

class DarkTheme extends ThemePickerState {
  const DarkTheme() : super(ThemeMode.dark);
}

class LightTheme extends ThemePickerState {
  const LightTheme() : super(ThemeMode.light);
}

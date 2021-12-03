part of 'theme_picker_cubit.dart';

@immutable
abstract class ThemePickerState {
  final bool isDarkMode;
  final Image image;

  const ThemePickerState(this.isDarkMode, this.image);
}

class DarkTheme extends ThemePickerState {
  DarkTheme() : super(true, Image.asset('images/red_wine.png'));
}

class LightTheme extends ThemePickerState {
  LightTheme() : super(false, Image.asset('images/white_wine.png'));
}

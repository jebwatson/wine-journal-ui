import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';

class MockThemePickerCubit extends MockCubit<ThemePickerState>
    implements ThemePickerCubit {}

void main() {
  group('toggle theme returns opposite theme', () {
    blocTest<ThemePickerCubit, ThemePickerState>(
      'toggle light theme returns dark theme',
      build: () => ThemePickerCubit(),
      act: (bloc) => bloc.toggleTheme(),
      expect: () => [isInstanceOf<DarkTheme>()],
    );

    blocTest<ThemePickerCubit, ThemePickerState>(
      'toggle dark theme returns light theme',
      build: () => ThemePickerCubit.initial(DarkTheme()),
      act: (bloc) => bloc.toggleTheme(),
      expect: () => [isInstanceOf<LightTheme>()],
    );
  });
}

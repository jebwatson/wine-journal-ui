import 'package:bloc_test/bloc_test.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';

void main() {
  blocTest<ThemePickerCubit, bool>(
    'toggle light theme returns dark theme',
    build: () => ThemePickerCubit(),
    act: (bloc) {
      bloc.toggleTheme();
      bloc.toggleTheme();
      bloc.toggleTheme();
    },
    expect: () => [true, false, true],
  );
}

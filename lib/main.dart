import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wine_journal_ui/features/home_page/home_page.dart';
import 'package:wine_journal_ui/features/new_entry/cubit/new_entry_visibility_cubit.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/features/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemePickerCubit(),
        ),
        BlocProvider(
          create: (context) => NewEntryVisibilityCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Watson Wine Journal',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: HomePage(),
      ),
    );
  }
}

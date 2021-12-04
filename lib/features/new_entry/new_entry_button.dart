import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';

class NewEntryButton extends StatelessWidget {
  const NewEntryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePickerCubit, ThemePickerState>(
      builder: (context, state) {
        return SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {},
            child: state.image,
          ),
        );
      },
    );
  }
}

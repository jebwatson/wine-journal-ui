import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/pallette.dart';

class NewEntryButton extends StatelessWidget {
  const NewEntryButton(this._drawerController, {Key? key}) : super(key: key);

  final BottomDrawerController _drawerController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePickerCubit, ThemePickerState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: state.isDarkMode ? merlot : rose,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(40),
                spreadRadius: 0.8,
                blurRadius: 10,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: IconButton(
              icon: state.image, onPressed: () => _drawerController.open()),
        );
      },
    );
  }
}

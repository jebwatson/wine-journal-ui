import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/pallette.dart';

class NewEntryDrawer extends StatelessWidget {
  const NewEntryDrawer(this._drawerController, {Key? key}) : super(key: key);

  final BottomDrawerController _drawerController;

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      color: Colors.transparent,
      header: Container(),
      body: _buildBody(),
      headerHeight: 0,
      drawerHeight: MediaQuery.of(context).size.height * 0.84,
      controller: _drawerController,
      followTheBody: false,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ThemePickerCubit, ThemePickerState>(
      builder: (context, state) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              _positionContent(context, state),
              _positionCloseButton(context),
            ],
          ),
        );
      },
    );
  }

  Positioned _positionCloseButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.01,
      right: MediaQuery.of(context).size.width * 0.02,
      child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _drawerController.close()),
    );
  }

  Positioned _positionContent(BuildContext context, ThemePickerState state) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        height: MediaQuery.of(context).size.height * 0.84,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: state.isDarkMode ? burgundy : chardonnay,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 20,
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: state.isDarkMode ? merlot : rose,
                  borderRadius: const BorderRadius.all(Radius.circular(32)),
                ),
                child: IconButton(
                  iconSize: 48,
                  onPressed: () {
                    print('Camera button press');
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  initialValue: 'Wine Name',
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  initialValue: 'Producer',
                ),
              ),
              TextFormField(
                initialValue: 'Producer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

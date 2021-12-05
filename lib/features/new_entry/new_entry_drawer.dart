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
              _positionBackground(context, state),
              _positionCloseButton(context),
              _positionContent(context, state),
            ],
          ),
        );
      },
    );
  }

  Positioned _positionBackground(BuildContext context, ThemePickerState state) {
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
      ),
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

  // Might consider making this a wizard to break content up across a few pages
  // Could try A/B testing to get a feel for it
  Widget _positionContent(BuildContext context, ThemePickerState state) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: const [
              NewEntryField('Wine Name'),
              NewEntryField('Producer'),
              NewEntryField('Vintage'),
              Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              NewEntryField('Purchase Price'),
              NewEntryField('Purchase Location'),
              Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              NewEntryField('Variety'),
              NewEntryField('Origin'),
              NewEntryField('Grape Varieties'),
              Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              NewEntryField('Appearance'),
              NewEntryField('Bouquette'),
              NewEntryField('Pallette'),
              Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewEntryField extends StatelessWidget {
  const NewEntryField(
    this._hintText, {
    Key? key,
  }) : super(key: key);

  final String _hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.90,
      child: TextField(
        decoration: InputDecoration(hintText: _hintText),
      ),
    );
  }
}

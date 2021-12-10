import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wine_journal_ui/features/new_entry/new_entry_button.dart';
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
              _positionContent(context, state),
              _positionCloseButton(context),
              _positionCameraButton(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget _positionCameraButton(BuildContext context, ThemePickerState state) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: NewEntryButton(() => print('camera button pressed')),
      ),
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
              _NewEntryHeader(),
              NewEntryField('Wine Name'),
              NewEntryField(
                'Purchase Price',
                inputType: TextInputType.number,
              ),
              NewEntryField('Purchase Location'),
              _NewEntryDivider(),
              NewEntryField('Producer'),
              NewEntryField(
                'Vintage',
                inputType: TextInputType.number,
              ),
              _NewEntryDivider(),
              NewEntryField('Variety'),
              NewEntryField('Origin'),
              NewEntryField('Grape Varieties'),
              _NewEntryDivider(),
              _GroupHeader('Appearance'),
              NewEntryField('Appearance'),
              _StandardRatingBar(),
              _NewEntryDivider(),
              _GroupHeader('Bouquette'),
              NewEntryField('Bouquette'),
              _StandardRatingBar(),
              _NewEntryDivider(),
              _GroupHeader('Pallette'),
              NewEntryField('Pallette'),
              _StandardRatingBar(),
              _NewEntryDivider(),
              NewEntryField('Final Thoughts'),
              _NewEntryDivider(),
              Padding(padding: EdgeInsets.only(bottom: 200)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewEntryHeader extends StatelessWidget {
  const _NewEntryHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Text(
          'New Entry',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader(
    this._text, {
    Key? key,
  }) : super(key: key);

  final String _text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          _text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _StandardRatingBar extends StatelessWidget {
  const _StandardRatingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: 55,
      allowHalfRating: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}

class _NewEntryDivider extends StatelessWidget {
  const _NewEntryDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
        builder: (context, state) {
          return Divider(
            color: state.isDarkMode
                ? magnolia.withOpacity(0.3)
                : Colors.black.withOpacity(0.3),
            thickness: 2,
            indent: 10,
            endIndent: 10,
          );
        },
      ),
    );
  }
}

class NewEntryField extends StatelessWidget {
  const NewEntryField(
    this._hintText, {
    Key? key,
    TextInputType inputType = TextInputType.text,
  })  : _inputType = inputType,
        super(key: key);

  final String _hintText;
  final TextInputType _inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width * 0.90,
      child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
        builder: (context, state) {
          return TextField(
            minLines: 1,
            maxLines: 20,
            keyboardType: _inputType,
            decoration: InputDecoration(
              hintText: _hintText,
              hintStyle:
                  TextStyle(color: state.isDarkMode ? magnolia : Colors.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: state.isDarkMode ? magnolia : Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}

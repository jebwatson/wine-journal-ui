import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wine_journal_ui/features/new_entry/cubit/new_entry_visibility_cubit.dart';
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
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.84,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: state.isDarkMode ? burgundy : chardonnay,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: state.isDarkMode ? merlot : rose,
                        child: Center(
                          child: Text('$index'),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.width * 0.02,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () =>
                      BlocProvider.of<NewEntryVisibilityCubit>(context)
                          .closeDrawer(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

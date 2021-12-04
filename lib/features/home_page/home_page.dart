import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wine_journal_ui/features/entries_carousel/entries_carousel.dart';
import 'package:wine_journal_ui/features/entries_tab_view/entries_tab_view.dart';
import 'package:wine_journal_ui/features/home_page/bottom_card.dart';
import 'package:wine_journal_ui/features/menu/hamburger_menu.dart';
import 'package:wine_journal_ui/features/new_entry/new_entry_button.dart';
import 'package:wine_journal_ui/features/theme/theme_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          _positionMenuButton(context),
          _positionBottomCard(context),
          _positionActionButton(),
          _positionTabView(context),
          _positionCarousel(context),
          _positionThemeSwitch(context),
        ],
      ),
    );
  }

  Positioned _positionMenuButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.08,
      left: MediaQuery.of(context).size.width * 0.04,
      child: const MenuButton(),
    );
  }

  Positioned _positionBottomCard(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .60,
      child: const BottomCard(),
    );
  }

  Padding _positionActionButton() {
    return const Padding(
      padding: EdgeInsets.all(26.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: NewEntryButton(),
      ),
    );
  }

  Positioned _positionTabView(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * .05,
      top: MediaQuery.of(context).size.height * .61,
      child: const EntriesTabView(),
    );
  }

  Positioned _positionCarousel(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.14,
      child: const EntriesCarousel(),
    );
  }

  Positioned _positionThemeSwitch(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.08,
      left: MediaQuery.of(context).size.width * 0.80,
      child: Transform.scale(
        scale: 1.5,
        child: const ThemeSwitch(),
      ),
    );
  }
}

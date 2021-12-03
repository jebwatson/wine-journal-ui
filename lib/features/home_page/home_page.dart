import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/features/theme/theme_switch.dart';
import 'package:wine_journal_ui/pallette.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardList = [
      Icon(Icons.one_k),
      Icon(Icons.two_k),
      Icon(Icons.three_k)
    ];
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          _buildMenuButton(context),
          _buildBottomCard(context),
          _buildActionButton(),
          _buildTabView(context),
          _buildCarousel(context, _cardList),
          _buildThemeSwitch(context),
        ],
      ),
    );
  }

  Positioned _buildMenuButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.08,
      left: MediaQuery.of(context).size.width * 0.04,
      child: Transform.scale(
        scale: 1.5,
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
    );
  }

  Positioned _buildBottomCard(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .60,
      child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.50,
            decoration: BoxDecoration(
              color: state.isDarkMode ? burgundy.shade500 : chardonnay.shade500,
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
          );
        },
      ),
    );
  }

  Padding _buildActionButton() {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
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
        ),
      ),
    );
  }

  Positioned _buildTabView(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * .05,
      top: MediaQuery.of(context).size.height * .61,
      child: DefaultTabController(
        length: 4,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.44,
          width: MediaQuery.of(context).size.width * .90,
          child: Column(
            children: [
              const TabBar(
                labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4,
                tabs: [
                  Tab(text: 'Recents'),
                  Tab(text: 'Favorites'),
                  Tab(text: 'Varieties'),
                  Tab(text: 'Origin'),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: const TabBarView(
                  children: [
                    Icon(Icons.recent_actors),
                    Icon(Icons.favorite),
                    Icon(Icons.search),
                    Icon(Icons.crop_original),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned _buildCarousel(BuildContext context, List<Icon> _cardList) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.14,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.44,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          items: _cardList.map((card) {
            return Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(40),
                        spreadRadius: 0.8,
                        blurRadius: 10,
                        offset: const Offset(10, 10),
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Theme.of(context).cardColor,
                    child: card,
                  ),
                ),
              );
            });
          }).toList(),
          options: CarouselOptions(
            disableCenter: true,
            viewportFraction: 0.7,
            pageSnapping: false,
            enlargeCenterPage: true,
          ),
        ),
      ),
    );
  }

  Positioned _buildThemeSwitch(BuildContext context) {
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

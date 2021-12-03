import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/features/theme/theme_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.04,
            child: Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.80,
            child: Transform.scale(
              scale: 1.5,
              child: const ThemeSwitch(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 80,
                width: 80,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
                    builder: (context, state) {
                      return state.image;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Watson Wine Journal'),
        actions: const [ThemeSwitch()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'New Entry',
        child: BlocBuilder<ThemePickerCubit, ThemePickerState>(
          builder: (context, state) {
            return state.image;
          },
        ),
      ),
    );
  }
}

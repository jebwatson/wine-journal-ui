import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wine_journal_ui/features/new_entry/custom_rect_tween.dart';
import 'package:wine_journal_ui/features/new_entry/hero_dialog_route.dart';
import 'package:wine_journal_ui/features/theme/cubit/theme_picker_cubit.dart';
import 'package:wine_journal_ui/pallette.dart';

class NewEntryButton extends StatelessWidget {
  const NewEntryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemePickerCubit, ThemePickerState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(HeroDialogRoute(builder: (context) {
              return const _AddTodoPopupCard();
            }));
          },
          child: Hero(
            tag: _heroAddTodo,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin, end: end);
            },
            child: Container(
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
              child: state.image,
            ),
          ),
        );
      },
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: chardonnay,
                borderRadius: BorderRadius.circular(32),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'New todo',
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.white,
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.2,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a note',
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.white,
                        maxLines: 6,
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.2,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

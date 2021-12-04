import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_entry_visibility_state.dart';

class NewEntryVisibilityCubit extends Cubit<bool> {
  NewEntryVisibilityCubit() : super(false);

  void toggleVisibility() {
    emit(!state);
  }

  void openDrawer() {
    emit(true);
  }

  void closeDrawer() {
    emit(false);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/notes_app/managers/cubit/note_selection/note_selection_state.dart';

class NoteSelectionCubit extends Cubit<NoteSelectionState> {
  NoteSelectionCubit() : super(NoteSelectionState(selectedNoteKeys: <dynamic>{}));

  void toggleSelection(dynamic noteKey) {
    final current = Set<dynamic>.from(state.selectedNoteKeys);
    if (current.contains(noteKey)) {
      current.remove(noteKey);
    } else {
      current.add(noteKey);
    }
    emit(state.copyWith(selectedNoteKeys: current));
  }

  void clearSelection() {
    emit(NoteSelectionState(selectedNoteKeys: <dynamic>{}));
  }
}
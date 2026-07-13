import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/helpers/constants.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/box_type/box_type_cubit.dart';
import 'move_note_state.dart';

class MoveNoteCubit extends Cubit<MoveNoteState> {
  MoveNoteCubit() : super(MoveNoteInitial());

  Future<void> moveMultipleNotes({
    required Set<dynamic> keysToMove,
    required BoxTypeCubit boxTypeCubit,
  }) async {
    emit(MoveNoteLoading());
    // print("Moving notes with keys: $keysToMove");

    try {
      final bool isCurrentlyPrivate = boxTypeCubit.state.isPrivateMode;

      final String sourceBoxName = isCurrentlyPrivate
          ? AppConstants.kPrivateNotesBox
          : AppConstants.kNotesBox;
      final String targetBoxName = isCurrentlyPrivate
          ? AppConstants.kNotesBox
          : AppConstants.kPrivateNotesBox;

      final sourceBox = await Hive.openBox<NoteModel>(sourceBoxName);
      final targetBox = await Hive.openBox<NoteModel>(targetBoxName);

      // print("Source Box ($sourceBoxName) open status: ${sourceBox.isOpen}");
      // print("Target Box ($targetBoxName) open status: ${targetBox.isOpen}");

      for (var key in keysToMove) {
        final note = sourceBox.get(key);
        if (note != null) {
          final tempNote = note.copyWith();

          await targetBox.add(tempNote);

          await sourceBox.delete(key);

          // print(
          //   "Moved note with key: $key from $sourceBoxName to $targetBoxName",
          // );
        } else {
          // print("Note with key: $key not found in $sourceBoxName");
        }
      }

      emit(MoveNoteSuccess());
    } catch (e) {
      // print("Error during moving notes: $e");
      // print(stacktrace);
      emit(MoveNoteFailure(errorMessage: e.toString()));
    }
  }
}

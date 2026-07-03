import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/core/helpers/constants.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';
import 'package:to_do_app/notes_app/managers/cubit/update_note/update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitial());

  void updateNote({
    required NoteModel note,
    required String title,
    required String subTitle,
  }) async {
    emit(UpdateNoteLoading());

    try {
      final updatedNote = note.copyWith(
        title: title,
        subTitle: subTitle,
        date: DateTime.now(),
      );

      final box = Hive.box<NoteModel>(AppConstants.kNotesBox);

      await box.put(note.key, updatedNote);

      emit(UpdateNoteSuccess());
    } catch (e) {
      emit(UpdateNoteFailure(e.toString()));
    }
  }
}

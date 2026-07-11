import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/notes_app/data/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote({required String boxName, required NoteModel note}) async {
    emit(AddNoteLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final targetBoxName = boxName;

      var notesBox = Hive.box<NoteModel>(targetBoxName);
      await notesBox.add(note);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure("حدث خطأ أثناء حفظ الملاحظة: ${e.toString()}"));
    }
  }
}
